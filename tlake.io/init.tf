terraform {
  required_version = ">= 1.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tlake"

    workspaces {
      name = "tlake-deployment__tlake-io"
    }
  }

  required_providers {
    dnsimple = {
      source  = "terraform-providers/dnsimple"
      version = ">= 0.6"
    }
  }
}

provider "dnsimple" {
  account = var.dnsimple_account
  token   = var.dnsimple_token
}
