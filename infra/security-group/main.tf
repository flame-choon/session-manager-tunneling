###########################
# SECURITY GROUP 
###########################
resource "aws_security_group" "bastion" {
  name        = join("-", compact([local.name_prefix, "bastion", "security", "group"]))
  description = "for Bastion"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc.id

  egress {
    description = "SSH to any"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "bastion", "security", "group"]))}"
  })
}


resource "aws_security_group" "rds" {
  name        = join("-", compact([local.name_prefix, "rds", "security", "group"]))
  description = "for RDS"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc.id

  ingress {
    description = "RDS connecting from VPC"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.vpc.cidr_block]
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
  }

  egress {
    description = "RDS to any"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "rds", "security", "group"]))}"
  })
}


resource "aws_security_group" "elasticache" {
  name        = join("-", compact([local.name_prefix, "elasticache", "security", "group"]))
  description = "ElastiCache for "

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc.id

  ingress {
    description = "ElasticCache connecting from VPC"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.vpc.cidr_block]
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
  }

  egress {
    description = "ElastiCache to any"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "elasticache", "security", "group"]))}"
  })
}