variable "server_name" {
  type = string
  default = "wordpress"
}

variable "env" {
  type = string
  default = "dev"
}

variable "instance" {
  type = number
  #default = 2
  validation {
    condition =var.instance >1 && var.instance<=5
    error_message = "Le nombre doit être compris entre 1 et 5"
  }
}

variable "enable_ip" {
  type = bool
  default = true
}

output "summary" {
  value= "Serveur ${var.server_name}, Instance ${var.instance}, IP Public ${var.enable_ip}"
}


# == LOCAL ==

locals {
  name_prefix = "${var.env}-${var.server_name}"
}

output "instance" {
  value= "${local.name_prefix}"
}

# == TYPE COMPLEXE ==

variable "az" {
  type = list(string)
  default = ["eu-west-3a", "eu-west-3b"]
}

output "show_az" {
  value = var.az[1]
}


variable "common_tags" {
  type = map(string)
  default = {
    "env" = "dev"
    project = "wordpress"
  }
}

output "tags" {
  value = var.common_tags["env"]
}

variable "db_config" {
  type = object({
    port = number
    root = bool
  })
  default = {
    port = 3306
    root = true
  }
}

output "db_port" {
  value = var.db_config.port
}


variable "prefix" {
  type = string
  default = "aws-infra"
}

output "string_demo" {
  value = {
    uppercase = upper(var.prefix)
    substring = substr(var.prefix, 4, 5)
    formatted = format("Instance-%s", "web")
  }
}

variable "mysql_password" {
  type = string
  sensitive = true
}
