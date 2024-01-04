###########################
# EC2 - Bastion
###########################

resource "aws_instance" "bastion-instance" {
  ami           = var.bastion-ami
  instance_type = "t3.micro"
  subnet_id     = data.terraform_remote_state.vpc.outputs.public-subnet-1.id
  root_block_device {
    volume_type = "gp3"
    volume_size = 16
  }

  vpc_security_group_ids = [
    data.terraform_remote_state.security_group.outputs.security_group.bastion_id
  ]
  iam_instance_profile = "flame-session-manager-role"

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "bastion", "instance"]))}"
  })
}