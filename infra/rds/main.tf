###########################
# DB SUBNET GROUP
###########################
resource "aws_db_subnet_group" "db-subnet-group" {
  name = join("-", compact([local.name_prefix, "db", "subnet", "group"]))
  subnet_ids = [data.terraform_remote_state.vpc.outputs.private-subnet-1.id,
    data.terraform_remote_state.vpc.outputs.private-subnet-2.id
  ]

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "db", "subnet", "group"]))}"
  })
}

###########################
# DB PARAMETER GROUP
###########################
resource "aws_db_parameter_group" "db-instance-parameter-group" {

  name   = join("-", compact([local.name_prefix, "db", "instance", "pg"]))
  family = var.family_name

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "db", "parameter", "group"]))}"
  })
}

resource "aws_rds_cluster_parameter_group" "db-cluster-parameter-group" {

  name   = join("-", compact([local.name_prefix, "db", "cluster", "pg"]))
  family = var.family_name

  parameter {
    name  = "collation_connection"
    value = "utf8mb4_general_ci"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "db", "parameter", "group"]))}"
  })
}

###########################
# DB CLUSTER
###########################
resource "aws_rds_cluster" "rdb-cluster" {

  cluster_identifier = var.cluster_identifier
  engine             = var.database_engine
  engine_version     = var.database_engine_version
  # availability_zones  = ["ap-northeast-2a", "ap-northeast-2b"]
  database_name   = var.database_name
  master_username = var.master_username
  master_password = var.master_password
  network_type    = "IPV4"

  storage_encrypted = true

  deletion_protection = true
  skip_final_snapshot = true
  apply_immediately   = true

  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids = [data.terraform_remote_state.security_group.outputs.security_group.rds_id]


  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "db", "cluster"]))}"
  })
}

###########################
# DB INSTANCE
###########################
resource "aws_rds_cluster_instance" "rdb-instance" {

  count              = 1
  identifier         = join("-", compact([var.cluster_identifier, "${count.index}"]))
  cluster_identifier = aws_rds_cluster.rdb-cluster.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.rdb-cluster.engine
  engine_version     = aws_rds_cluster.rdb-cluster.engine_version

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "db", "instance"]))}"
  })
}