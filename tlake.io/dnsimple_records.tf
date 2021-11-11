################
# ROOT
################

resource "dnsimple_record" "www_tlake_io" {
  domain = var.dnsimple_domain
  name   = "www"
  value  = "tlake.io"
  type   = "CNAME"
  ttl    = var.default_ttl
}

################
# ALIAS
################

resource "dnsimple_record" "alias_tlake_io" {
  domain = var.dnsimple_domain
  name   = ""
  value  = "tlake.github.io"
  type   = "ALIAS"
  ttl    = var.default_ttl
}

resource "dnsimple_record" "alias_txt_tlake_io" {
  domain = var.dnsimple_domain
  name   = ""
  value  = "ALIAS for tlake.github.io"
  type   = "TXT"
  ttl    = var.default_ttl
}

################
# A
################

resource "dnsimple_record" "tlake_io_subdomain_home_routes" {
  for_each = toset([
    "bitwarden",
    "cloud",
    "docker-registry",
    "foundry",
    "gitlab",
    "mc",
    "minecraft",
    "portainer",
    "portainer-agent-artemicion",
  ])

  domain = var.dnsimple_domain
  name = each.value
  value  = var.home_ip_address
  type   = "A"
  ttl    = var.default_ttl
}


resource "dnsimple_record" "tlake_io_subdomain_porkbun_routes" {
  for_each = toset([
    "blog",
    "email",
  ])

  domain = var.dnsimple_domain
  name   = each.value
  value  = var.porkbun_ip_address
  type   = "A"
  ttl    = var.default_ttl
}

################
# MISC
################

locals {
  txt_challenges = [
    { record_name: "_acme-challenge",     record_value: "5zj3Pr2eRPPyw5S4euvnZ98qubjcLqAbO2aEz53h-lo", },
    { record_name: "_acme-challenge",     record_value: "5VV_XGcGHlA8m3Eg2xODf0YLr2FealenncWLEB6a2Hk", },
    { record_name: "_acme-challenge",     record_value: "NJZu_dPxwNqbliE8sUiQ4qcIzzPHFk7IiPIr_3gXd9o", },
    { record_name: "_acme-challenge",     record_value: "C30lQ5JRtgXzqctmzk9aK5AgiuYYPSAjnt6-J0cZ1GQ", },
    { record_name: "_acme-challenge.www", record_value: "2eAi2LfAqe2kZD1exDz4YJz2PnlwznNBz-FDOSV3e4c", },
    { record_name: "_acme-challenge.www", record_value: "ztNqyaS4r9atH4FaWb3CMpCWTmXnH7xyJ276LzklQpQ", },
    { record_name: "_acme-challenge.www", record_value: "MQl-hplvzWNmkqOF4l3_ntOzBOYAKjNj_Tamn3Endtg", },
    { record_name: "_acme-challenge.www", record_value: "TEJuZs7UoIaRFrylsCKW9wtsP-ICR8li7zD8wCCHPeM", },
  ]
}

resource "dnsimple_record" "tlake_io_txt_challenges" {
  count = length(local.txt_challenges)

  domain = var.dnsimple_domain
  name   = local.txt_challenges[count.index]["record_name"]
  value  = local.txt_challenges[count.index]["record_value"]
  type   = "TXT"
  ttl    = 1
}

