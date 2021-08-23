################
# tlake-infra
################

resource "aws_vpc" "tlake_infra" {
  cidr_block = "10.100.0.0/16"

  tags = {
    Name = "tlake-infra"
  }
}

resource "aws_security_group" "tlake_infra_default" {
  description = "default VPC security group"
  name        = "default"
  vpc_id      = aws_vpc.tlake_infra.id

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
    },
  ]

  ingress = [
    {
      cidr_blocks      = []
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = true
      to_port          = 0
    },
  ]
}
