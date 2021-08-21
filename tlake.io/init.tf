terraform {
  required_version = ">= 0.13"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tlake"

    workspaces {
      name = "tlake-deployment__tlake-io"
    }
  }

  required_providers {
    dnsimple = {
      source = "terraform-providers/dnsimple"
    }
  }
}

provider dnsimple {
  token   = var.dnsimple_token
  account = var.dnsimple_account
}
