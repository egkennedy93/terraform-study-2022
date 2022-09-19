terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.29.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  shared_config_files = ["/home/egkennedy93/.aws/config"]
  shared_credentials_files = ["/home/egkennedy93/.aws/credentials"]
}

