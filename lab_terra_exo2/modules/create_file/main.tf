provider "local" {}

resource "local_file" "network_blueprint_file" {
  #filename = "${path.module}/network_blueprint.txt"
  filename = "./network_blueprint.txt"
  content  = <<-EOT
  Availability zones : ${join(", ", var.availability_zones)}
  DEV : ${var.subnet_cidrs["dev"]}
  STAGING : ${lookup(var.subnet_cidrs, "staging", "test")}
  PROD : ${var.subnet_cidrs["prod"]}
  EOT
}


