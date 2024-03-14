variable "cloudflare_account_id" {
  type = string
}

variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_proxy_ttl" {
  default = 1
  type    = number
}

variable "default_ttl" {
  type = number
}

variable "home_ip_address" {
  type = string
}

variable "porkbun_ip_address" {
  type = string
}

