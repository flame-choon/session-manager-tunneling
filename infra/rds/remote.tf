data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    region = "ap-northeast-2"
    key    = "session-manager/vpc/terraform.tfstate"
    bucket = "flame-tf"
  }
}

data "terraform_remote_state" "security_group" {
  backend = "s3"

  config = {
    region = "ap-northeast-2"
    key    = "session-manager/security-group/terraform.tfstate"
    bucket = "flame-tf"
  }
}
