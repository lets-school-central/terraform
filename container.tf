resource "scaleway_container_namespace" "prod" {
  region     = var.region
  name       = "prod"
}
