# Terraform Remote State

This directory contains Terraform files used to generate the AWS resources required for storing Terraform state remotely.
**This should only need to be run once in order to generate these resources!**
The main Terraform deployment should then be able to use S3 as a remote backend with locking provided by a DynamoDB table.


## Usage

Make sure that you've run `aws configure` to set the credentials appropriate to your AWS account!
Run `terraform plan`, then `terraform apply` if the plan looks right.
