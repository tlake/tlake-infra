#################
## ROOT
#################

resource "cloudflare_zone" "zones" {
  for_each = toset([
    "tlake.io",
    "mechamoogle.com",
    "tannerjlake.com",
  ])

  account_id = var.cloudflare_account_id
  zone       = each.key
}

resource "cloudflare_record" "www_tlake_io" {
  zone_id = cloudflare_zone.zones["tlake.io"].id
  name    = "www"
  proxied = true
  value   = "tlake.io"
  type    = "CNAME"
  ttl     = var.cloudflare_proxy_ttl
}

#################
## ALIAS
#################

# TODO: figure out how to replace alias in cf since it doesn't exist

#resource "cloudflare_record" "alias_tlake_io" {
#  zone_id = cloudflare_zone.zones["tlake.io"].id
#  name   = ""
#  value  = "tlake.github.io"
#  type   = "ALIAS"
#  ttl    = var.cloudflare_proxy_ttl
#}
#
#resource "cloudflare_record" "alias_txt_tlake_io" {
#  zone_id = cloudflare_zone.zones["tlake.io"].id
#  name   = ""
#  value  = "ALIAS for tlake.github.io"
#  type   = "TXT"
#  ttl    = var.cloudflare_proxy_ttl
#}

#################
## A
#################

resource "cloudflare_record" "tlake_io_subdomain_home_routes" {
  for_each = toset([
    "actual",
    "actualbudget",
    "ando-mcfoundry",
    "argocd",
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
    "vaultwarden",
  ])

  zone_id = cloudflare_zone.zones["tlake.io"].id
  name    = each.value
  proxied = true
  value   = var.home_ip_address
  type    = "A"
  ttl     = var.cloudflare_proxy_ttl
}


resource "cloudflare_record" "tlake_io_subdomain_porkbun_routes" {
  for_each = toset([
    "blog",
    "email",
  ])

  zone_id = cloudflare_zone.zones["tlake.io"].id
  name    = each.value
  proxied = true
  value   = var.porkbun_ip_address
  type    = "A"
  ttl     = var.cloudflare_proxy_ttl
}

#################
## MISC
#################

resource "cloudflare_record" "tlake_io_txt_challenges" {
  count = length(local.txt_challenges)

  zone_id = cloudflare_zone.zones["tlake.io"].id
  name    = local.txt_challenges[count.index]["record_name"]
  value   = local.txt_challenges[count.index]["record_value"]
  type    = "TXT"
  ttl     = 1
}

