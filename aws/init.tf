terraform {
  required_version = ">= 1.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tlake"

    workspaces {
      name = "tlake-deployment__aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.55"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      "Process" = "Managed by Terraform"
    }
  }
}
