#################
## ROOT
#################

resource "cloudflare_zone" "tlake_io" {
  account_id = var.cloudflare_account_id
  zone = "tlake.io"
}

resource "cloudflare_record" "www_tlake_io" {
  zone_id = cloudflare_zone.tlake_io.id
  name   = "www"
  value  = "tlake.io"
  type   = "CNAME"
  ttl    = var.default_ttl
}

#################
## ALIAS
#################

# TODO: figure out how to replace alias in cf since it doesn't exist

#resource "cloudflare_record" "alias_tlake_io" {
#  zone_id = cloudflare_zone.tlake_io.id
#  name   = ""
#  value  = "tlake.github.io"
#  type   = "ALIAS"
#  ttl    = var.default_ttl
#}
#
#resource "cloudflare_record" "alias_txt_tlake_io" {
#  zone_id = cloudflare_zone.tlake_io.id
#  name   = ""
#  value  = "ALIAS for tlake.github.io"
#  type   = "TXT"
#  ttl    = var.default_ttl
#}

#################
## A
#################

resource "cloudflare_record" "tlake_io_subdomain_home_routes" {
  for_each = toset([
    "actual",
    "ando-mcfoundry",
    "bitwarden",
    "calibre-web",
    "cloud",
    "docker-registry",
    "firefly",
    "firefly-importer",
    "foundry",
    "ghostfolio",
    "gitea",
    "gitlab",
    "lazylibrarian",
    "mc",
    "minecraft",
    "portainer",
    "stable-diffusion",
  ])

  zone_id = cloudflare_zone.tlake_io.id
  name = each.value
  value  = var.home_ip_address
  type   = "A"
  ttl    = var.default_ttl
}


resource "cloudflare_record" "tlake_io_subdomain_porkbun_routes" {
  for_each = toset([
    "blog",
    "email",
  ])

  zone_id = cloudflare_zone.tlake_io.id
  name   = each.value
  value  = var.porkbun_ip_address
  type   = "A"
  ttl    = var.default_ttl
}

#################
## MISC
#################

#locals {
#  txt_challenges = [
#    { record_name: "_acme-challenge",     record_value: "5zj3Pr2eRPPyw5S4euvnZ98qubjcLqAbO2aEz53h-lo", },
#    { record_name: "_acme-challenge",     record_value: "5VV_XGcGHlA8m3Eg2xODf0YLr2FealenncWLEB6a2Hk", },
#    { record_name: "_acme-challenge",     record_value: "NJZu_dPxwNqbliE8sUiQ4qcIzzPHFk7IiPIr_3gXd9o", },
#    { record_name: "_acme-challenge",     record_value: "C30lQ5JRtgXzqctmzk9aK5AgiuYYPSAjnt6-J0cZ1GQ", },
#    { record_name: "_acme-challenge.www", record_value: "2eAi2LfAqe2kZD1exDz4YJz2PnlwznNBz-FDOSV3e4c", },
#    { record_name: "_acme-challenge.www", record_value: "ztNqyaS4r9atH4FaWb3CMpCWTmXnH7xyJ276LzklQpQ", },
#    { record_name: "_acme-challenge.www", record_value: "MQl-hplvzWNmkqOF4l3_ntOzBOYAKjNj_Tamn3Endtg", },
#    { record_name: "_acme-challenge.www", record_value: "TEJuZs7UoIaRFrylsCKW9wtsP-ICR8li7zD8wCCHPeM", },
#  ]
#}

resource "cloudflare_record" "tlake_io_txt_challenges" {
  count = length(local.txt_challenges)

  zone_id = cloudflare_zone.tlake_io.id
  name   = local.txt_challenges[count.index]["record_name"]
  value  = local.txt_challenges[count.index]["record_value"]
  type   = "TXT"
  ttl    = 1
}

