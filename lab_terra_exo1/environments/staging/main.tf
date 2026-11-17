module "create_file" {
 source = "../../modules/create_file"

 aws_region = "eu-west-2"
 instance_count = 4
 enable_monitoring = true
}


