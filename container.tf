resource "scaleway_container_namespace" "prod" {
  region     = var.region
  name       = "prod"
}

resource "scaleway_container" "app-api" {
  name            = "app-api"
  description     = "The app API container"
  namespace_id    = scaleway_container_namespace.prod.id
  registry_image  = var.app_api_container_image
  port            = 8080
  cpu_limit       = 280
  memory_limit    = 512
  min_scale       = 1
  max_scale       = 1
  timeout         = 60
  max_concurrency = 80
  privacy         = "public"
  protocol        = "http1"
  http_option     = "redirected"
  deploy          = true

  timeouts {
    create = "15m"
    update = "15m"
  }

  secret_environment_variables = {
    REPLICA_BUCKET            = scaleway_object_bucket.prod-data.name
    REPLICA_REGION            = var.region
    REPLICA_ACCESS_KEY_ID     = var.scaleway_access_key
    REPLICA_SECRET_ACCESS_KEY = var.scaleway_secret_key
  }
}

resource scaleway_container_domain "app-api" {
  container_id = scaleway_container.app-api.id
  hostname = "backend.${var.domain_name}"

  depends_on = [godaddy_domain_record.app]
}

resource "scaleway_container" "app-web" {
  name            = "app-web"
  namespace_id    = scaleway_container_namespace.prod.id
  registry_image  = var.app_web_container_image
  port            = 8080
  cpu_limit       = 280
  memory_limit    = 512
  min_scale       = 1
  max_scale       = 1
  timeout         = 60
  max_concurrency = 80
  privacy         = "public"
  protocol        = "http1"
  http_option     = "redirected"
  deploy          = true

  timeouts {
    create = "15m"
    update = "15m"
  }
}

resource scaleway_container_domain "app-web" {
  container_id = scaleway_container.app-web.id
  hostname = "www.${var.domain_name}"

  depends_on = [godaddy_domain_record.app]
}
