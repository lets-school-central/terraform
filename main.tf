variable "scaleway_access_key" {
  type      = string
  sensitive = true
}
variable "scaleway_secret_key" {
  type      = string
  sensitive = true
}
variable "scaleway_organization_id" {
  type      = string
  sensitive = true
}
variable "scaleway_project_id" {
  type      = string
  sensitive = true
}
variable "godaddy_key" {
  type      = string
  sensitive = true
}
variable "godaddy_secret" {
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
    godaddy = {
      source = "n3integration/godaddy"
      version = "1.9.1"
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
  access_key      = var.scaleway_access_key
  secret_key      = var.scaleway_secret_key
  organization_id = var.scaleway_organization_id
  project_id      = var.scaleway_project_id
  region          = var.region
  zone            = var.zone
}

provider "godaddy" {
  key    = var.godaddy_key
  secret = var.godaddy_secret
}