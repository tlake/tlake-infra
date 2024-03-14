terraform {
  required_version = ">= 1.1"

  cloud {
    organization = "tlake"

    workspaces {
      name = "tlake-infra-aws"
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
