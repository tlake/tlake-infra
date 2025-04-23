variable "cloudflare_account_id" {
  description = "ID of the CloudFlare account."
  type        = string
}

variable "cloudflare_api_token" {
  description = "API token used for interacting with the CloudFlare account."
  type        = string
}

variable "cloudflare_proxy_ttl" {
  default     = 1
  description = "Default CloudFlare proxy TTL."
  type        = number
}

variable "home_ip_address" {
  description = "The home IP address."
  type        = string
}

variable "porkbun_ip_address" {
  description = "Porkbun IP address."
  type        = string
}

