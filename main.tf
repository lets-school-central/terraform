variable "access_key" {
  type      = string
  sensitive = true
}
variable "secret_key" {
  type      = string
  sensitive = true
}
variable "organization_id" {
  type      = string
  sensitive = true
}
variable "project_id" {
  type      = string
  sensitive = true
}
variable "region" {
  type    = string
  default = "fr-par"
}
variable "zone" {
  type    = string
  default = "fr-par-1"
}
variable "app_api_container_image" {
  type = string
}

terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = ">= 2.8.0"
    }
  }
  required_version = ">= 0.13"
  backend "s3" {
    bucket                      = "lets-school-central-terraform-state"
    key                         = "terraform.tfstate"
    region                      = "fr-par"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}

provider "scaleway" {
  access_key      = var.access_key
  secret_key      = var.secret_key
  organization_id = var.organization_id
  project_id      = var.project_id
  region          = var.region
  zone            = var.zone
}
