terraform {
  required_version = "1.5.5"

  cloud {
    hostname     = "app.terraform.io"
    organization = "tlake"

    workspaces {
      name = "tlake-infra-dns"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
