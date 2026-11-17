
variable "project_name" {
  type = string
  default = "ecommerce"
}

variable "environment" {
  type = string
  default = "production"
}

variable "owner" {
  type = string
  default = "equipe-cloud"
}


locals {
  resource_prefix = "${var.environment}-${var.project_name}"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
  }
}

