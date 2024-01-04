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
