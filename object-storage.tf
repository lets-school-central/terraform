resource "scaleway_object_bucket" "prod-data" {
  name   = "lets-school-central-prod-data"
  region = var.region
}
