terraform {
  backend "s3" {
      bucket = "tfstatebucket-5c2c94d78afb4d233ed54a70fea8d6cb"
      key="test-prefix/state"
      region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }

  }
  required_version = ">=0.14.9"
}

module "caleb-ec2" {
  source = "./modules/terraform-aws-caleb-ec2"
  instance_name = terraform.workspace == "default" ? "DEFAULT" : "NOT-DEFAULT"
  region = terraform.workspace == "default" ? "us-east-1" : "us-west-2"
  ami =  terraform.workspace == "default" ? "ami-09e67e426f25ce0d7" : "ami-0cf6f5c8a62fa5da6"
}

output "ec2_name" {
    value = module.caleb-ec2.name
}

output "ec2_id" {
    value = module.caleb-ec2.instance_id
}

output "ec2_pub_ip" {
    value = module.caleb-ec2.instance_pub_ip
}