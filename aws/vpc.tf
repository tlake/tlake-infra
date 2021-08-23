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
    Name = "Default SG for Default VPC"
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

################
# old codefellows
################

resource "aws_security_group" "codefellows_ssh" {
  name        = "ssh-access"
  description = "Security Group created for Code Fellows"
  vpc_id      = aws_default_vpc.default.id

  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 5432
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 5432
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
  ]
}
