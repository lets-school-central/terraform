resource "scaleway_container" "app_api" {
  name            = "app-api"
  description     = "The app API container"
  namespace_id    = scaleway_container_namespace.prod.id
  registry_image  = var.app_api_container_image
  port            = 8080
  cpu_limit       = 140
  memory_limit    = 256
  min_scale       = 1
  max_scale       = 1
  timeout         = 300
  max_concurrency = 80
  privacy         = "public"
  protocol        = "h2c"
  deploy          = true

  timeouts {
    create = "15m"
    update = "15m"
  }

  environment_variables = {
    PORT = "8080"
  }
  secret_environment_variables = {
    REPLICA_BUCKET            = scaleway_object_bucket.prod-data.endpoint
    REPLICA_REGION            = var.region
    REPLICA_ACCESS_KEY_ID     = var.access_key
    REPLICA_SECRET_ACCESS_KEY = var.secret_key
  }
}