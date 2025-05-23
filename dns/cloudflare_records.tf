#################
## ROOT
#################

resource "cloudflare_zone" "zones" {
  for_each = toset([
    "exo-archive.org",
    "tlake.io",
    "mechamoogle.com",
    "tannerjlake.com",
  ])

  account_id = var.cloudflare_account_id
  zone       = each.key
}

resource "cloudflare_record" "www_tlake_io" {
  content = "tlake.io"
  name    = "www"
  proxied = true
  ttl     = var.cloudflare_proxy_ttl
  type    = "CNAME"
  zone_id = cloudflare_zone.zones["tlake.io"].id
}

#################
## ALIAS
#################

# TODO: figure out how to replace alias in cf since it doesn't exist

#resource "cloudflare_record" "alias_tlake_io" {
#  content  = "tlake.github.io"
#  name   = ""
#  ttl    = var.cloudflare_proxy_ttl
#  type   = "ALIAS"
#  zone_id = cloudflare_zone.zones["tlake.io"].id
#}
#
#resource "cloudflare_record" "alias_txt_tlake_io" {
#  content  = "ALIAS for tlake.github.io"
#  name   = ""
#  ttl    = var.cloudflare_proxy_ttl
#  type   = "TXT"
#  zone_id = cloudflare_zone.zones["tlake.io"].id
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
    "calibre",
    "calibre-web",
    "cloud",
    "collabora",
    "docker-registry",
    "firefly",
    "firefly-importer",
    "foundry",
    "ghostfolio",
    "gitea",
    "gitlab",
    "grafana",
    "jellyfin",
    "lazylibrarian",
    "mc",
    "minecraft",
    "oci-registry",
    "ociregistry",
    "portainer",
    "registry",
    "rss",
    "stable-diffusion",
    "vaultwarden",
    "wiki",
  ])

  content = var.home_ip_address
  name    = each.value
  proxied = true
  ttl     = var.cloudflare_proxy_ttl
  type    = "A"
  zone_id = cloudflare_zone.zones["tlake.io"].id
}


resource "cloudflare_record" "tlake_io_subdomain_porkbun_routes" {
  for_each = toset([
    "blog",
    "email",
  ])

  content = var.porkbun_ip_address
  name    = each.value
  proxied = true
  ttl     = var.cloudflare_proxy_ttl
  type    = "A"
  zone_id = cloudflare_zone.zones["tlake.io"].id
}

#################
## AAAA
#################

resource "cloudflare_record" "exo_archive_org_github_pages_ipv6" {
  for_each = toset([
    for c in data.github_ip_ranges.this.pages_ipv6 : cidrhost(c, 0)
  ])

  content = each.value
  name    = "@"
  proxied = true
  ttl     = var.cloudflare_proxy_ttl
  type    = "AAAA"
  zone_id = cloudflare_zone.zones["exo-archive.org"].id
}

resource "cloudflare_record" "tlake_io_github_pages_ipv6" {
  for_each = toset([
    for c in data.github_ip_ranges.this.pages_ipv6 : cidrhost(c, 0)
  ])

  content = each.value
  name    = "@"
  proxied = true
  ttl     = var.cloudflare_proxy_ttl
  type    = "AAAA"
  zone_id = cloudflare_zone.zones["tlake.io"].id
}

#################
## MISC
#################

resource "cloudflare_record" "tlake_io_txt_challenges" {
  count = length(local.txt_challenges)

  content = local.txt_challenges[count.index]["record_value"]
  name    = local.txt_challenges[count.index]["record_name"]
  ttl     = 1
  type    = "TXT"
  zone_id = cloudflare_zone.zones["tlake.io"].id
}

