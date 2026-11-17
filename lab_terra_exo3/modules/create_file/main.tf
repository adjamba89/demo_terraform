
provider "local" {
  # Configuration options
}

resource "local_file" "aws_tags_file" {
  filename = "./aws_tags_report.txt"
  content  = <<-EOT
  Name : ${local.resource_prefix}

  Project : ${local.common_tags.Project}
  Environment : ${local.common_tags.Environment}
  Owner : ${local.common_tags.Owner}
  EOT
}
