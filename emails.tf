resource "scaleway_tem_domain" "main" {
  accept_tos = true
  name       = var.domain_name
}
