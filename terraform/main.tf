terraform {
  backend "s3" {
    encrypt        = true
    region         = "us-west-2"
    bucket         = "tlake-terraform-remote-state-storage-s3"
    key            = "terraform-remote-state/terraform.tfstate"
    dynamodb_table = "tlake-terraform-state-lock-dynamo"
  }
}
