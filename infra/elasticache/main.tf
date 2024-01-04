######################################################
# ELASTICACHE SUBNET GROUP
######################################################
resource "aws_elasticache_subnet_group" "elasticache-subnet-group" {

  name        = join("-", compact([local.name_prefix, "elasticache", "subnet", "group"]))
  description = "subnet group for "

  subnet_ids = [data.terraform_remote_state.vpc.outputs.private-subnet-1.id,
    data.terraform_remote_state.vpc.outputs.private-subnet-2.id]

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "elasticache", "subnet", "group"]))}"
  })
}


######################################################
# ELASTICACHE PARAMETER GROUP
######################################################
resource "aws_elasticache_parameter_group" "elasticache-parameter-group" {

  name        = join("-", compact([local.name_prefix, "elasticache", "parameter", "group"]))
  family      = "redis7"
  description = "parameter group for "

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "elasticache", "parameter", "group"]))}"
  })
}


######################################################
# ELASTICACHE CLUSTER
######################################################
resource "aws_elasticache_cluster" "elasticache-cluster" {

  cluster_id           = join("-", compact([local.name_prefix, "elasticache", "cluster"]))
  engine               = "redis"
  engine_version       = "7.0"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.elasticache-parameter-group.id
  subnet_group_name    = aws_elasticache_subnet_group.elasticache-subnet-group.id
  security_group_ids   = [data.terraform_remote_state.security_group.outputs.security_group.elasticache_id]

  apply_immediately = true

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "elasticache", "cluster"]))}"
  })
}