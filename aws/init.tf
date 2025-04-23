terraform {
  required_version = "~>1.5.0"

  cloud {
    hostname     = "app.terraform.io"
    organization = "tlake"

    workspaces {
      name = "tlake-infra-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.41"
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
