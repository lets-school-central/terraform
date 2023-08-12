variable "domain_name" {
  type    = string
  default = "lets-school-central.app"
}

resource "godaddy_domain_record" "app" {
  domain = var.domain_name

  nameservers = [
    "ns75.domaincontrol.com",
    "ns76.domaincontrol.com",
  ]

  record {
    name = "backend"
    type = "CNAME"
    data = scaleway_container.app-api.domain_name
    ttl  = 3600
  }

  record {
    name = "www"
    type = "CNAME"
    data = scaleway_container.app-web.domain_name
    ttl  = 3600
  }

  record {
    data = "_domainconnect.gd.domaincontrol.com"
    name = "_domainconnect"
    ttl  = 3600
    type = "CNAME"
  }

  record {
    data = var._github-challenge-letsschoolcentral-org
    name = "_github-challenge-letsschoolcentral-org"
    ttl  = 3600
    type = "TXT"
  }

  record {
    data = var._github-challenge-lets-school-central-org_www
    name = "_github-challenge-lets-school-central-org.www"
    ttl  = 3600
    type = "TXT"
  }

  record {
    data = var._github-pages-challenge-letsschoolcentral
    name = "_github-pages-challenge-letsschoolcentral"
    ttl  = 3600
    type = "TXT"
  }

  record {
    data = "v=spf1 ${scaleway_tem_domain.main.spf_config} -all"
    name = "@"
    ttl  = 3600
    type = "TXT"
  }

  record {
    data = scaleway_tem_domain.main.dkim_config
    name = "${scaleway_tem_domain.main.project_id}._domainkey"
    ttl  = 3600
    type = "TXT"
  }

  record {
    data = "."
    name = "@"
    type = "MX"
  }
}

variable "_github-challenge-letsschoolcentral-org" {
  type = string
}

variable "_github-pages-challenge-letsschoolcentral" {
  type = string
}

variable "_github-challenge-lets-school-central-org_www" {
  type = string
}