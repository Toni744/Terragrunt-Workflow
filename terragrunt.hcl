locals {
  aws_region = "us-east-1"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

inputs = {
  aws_region = local.aws_region
  project    = "ha-vpc-setup"
  environment = "production"
}