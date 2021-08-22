################
# default
################

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "defaults" {
  for_each = toset([
    "us-west-2a",
    "us-west-2b",
    "us-west-2c",
    "us-west-2d",
  ])

  availability_zone = each.key

  tags = {
    Name = "Default Subnet in AZ ${each.key}"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id

  tags = {
    Name   = "Default SG for Default VPC"
  }
}

################
# tlake-infra
################

resource "aws_vpc" "tlake_infra" {
  cidr_block = "10.100.0.0/16"

  tags = {
    Name = "tlake-infra"
  }
}
