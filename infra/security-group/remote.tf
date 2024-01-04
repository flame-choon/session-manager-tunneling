data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    region = "ap-northeast-2"
    key    = "session-manager/vpc/terraform.tfstate"
    bucket = "flame-tf"
  }
}
