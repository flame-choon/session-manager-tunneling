variable "project_name" {
  type        = string
  description = "project Name for Naming"
  default     = "flame"
}

variable "region_code" {
  type        = string
  description = "region code for Naming"
  default     = "apne2"
}

variable "target_env" {
  type        = string
  description = "target envrionment for Naming"
  default     = "test"
}

variable "region" {
  type        = string
  description = "Target region"
  default     = "ap-northeast-2"
}

variable "account" {
  type        = string
  description = "Target AWS account number"
  default     = "767404772322"
}

variable "family_name" {
  type        = string
  description = "family of Database"
  default     = "aurora-mysql8.0"
}

variable "cluster_identifier" {
  type        = string
  description = "Cluster Identifier"
  default     = "flame-apne2-test-db-cluster"
}

variable "database_name" {
  type        = string
  description = "Database Name"
  default     = "flame"
}

variable "database_engine" {
  type        = string
  description = "Database Engine"
  default     = "aurora-mysql"
}

variable "database_engine_version" {
  type        = string
  description = "engine version of database"
  default     = "8.0.mysql_aurora.3.04.1"
}

variable "instance_class" {
  type        = string
  description = "type of instance"
  default     = "db.t3.medium"
}

variable "master_username" {

}

variable "master_password" {

}