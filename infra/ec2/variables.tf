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

variable "bastion-key" {
  type        = string
  description = "key for bastion"
  default     = "flame-key"
}

variable "bastion-ami" {
  type        = string
  description = "ami for ec2 instance"
  default     = "ami-0ff1cd0b5d98708d1"
}