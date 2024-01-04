locals {
  name_prefix = "${var.project_name}-${var.region_code}-${var.target_env}"

  default_tags = {
    Terraform   = "true"
    Environment = var.target_env
    Owner       = "flame"
  }
}