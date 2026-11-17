provider "local" {}

resource "local_file" "aws_deploy_file" {
  filename = "./aws_deployment.txt" 
  #filename = "${path.module}/aws_deployement.txt"
  #content  = "Fichier principal de déploiement pour une instance de AWS EC2"
  content = <<-EOT
                Region : ${var.aws_region}
                Instance: ${var.instance_count}
                CloudWatch: ${var.enable_monitoring}
           EOT
}

