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

module "caleb_ec2" {
  source = "./modules/caleb_ec2"
  instance_name = "sourced from module"
}

output "ec2_name" {
    value = module.caleb_ec2.name
}

output "ec2_id" {
    value = module.caleb_ec2.instance_id
}

output "ec2_pub_ip" {
    value = module.caleb_ec2.instance_pub_ip
}