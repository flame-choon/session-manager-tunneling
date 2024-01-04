terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    encrypt        = true
    key            = "session-manager/rds/terraform.tfstate"
    region         = "ap-northeast-2"
    bucket         = "flame-tf"
    dynamodb_table = "flame-tf-lock"
  }
}

provider "aws" {
  region = var.region
}
