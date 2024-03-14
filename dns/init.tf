terraform {
  required_version = "1.5.5"

  cloud {
    hostname     = "app.terraform.io"
    organization = "tlake"

    workspaces {
      name = "tlake-deployment__tlake-io"
    }
  }

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = ">= 4.0"
    }

    dnsimple = {
      source  = "terraform-providers/dnsimple"
      version = "= 0.6"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "dnsimple" {
  account = var.dnsimple_account
  token   = var.dnsimple_token
}
