################
# tlake-general
################

resource "aws_instance" "tlake_general" {
  ami                  = "ami-0e34e7b9ca0ace12d"
  iam_instance_profile = "ec2-ssm-role"
  instance_type        = "t2.micro"
  security_groups      = [
    aws_security_group.tlake_default.name,
    aws_security_group.tlake_ec2_apps.name,
  ]

  tags = {
    Name = "tlake-general"
  }
}

resource "aws_ebs_volume" "tlake_general" {
  availability_zone = aws_instance.tlake_general.availability_zone
  size = 32
  type = "gp2"
  tags = {
    "Name" = "tlake-general"
  }
}

resource "aws_volume_attachment" "tlake_general" {
  device_name = "/dev/xvda"
  instance_id = aws_instance.tlake_general.id
  volume_id = aws_ebs_volume.tlake_general.id
}
