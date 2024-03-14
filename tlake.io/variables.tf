variable "default_ttl" {
  type = number
}

variable "cloudflare_account_id" {
  type = string
}

variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_proxy_ttl" {
  default = 1
  type = number
}

variable "dnsimple_account" {
  type = string
}

variable "dnsimple_domain" {
  type = string
}

variable "dnsimple_token" {
  type = string
}

variable "home_ip_address" {
  type = string
}

variable "porkbun_ip_address" {
  type = string
}
