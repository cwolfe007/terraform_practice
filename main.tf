terraform {
  backend "s3" {
      bucket = "tfstatebucket-5c2c94d78afb4d233ed54a70fea8d6cb"
      key="/"
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

variable "instance_name" {
    description = "Value of the name of the EC2 instance"
    type = string
    default = "GETRICKITYWRECKEDSON"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.instance_name
    "ANewTag" = "wow such change"
  }
}

output "instance_id" {
    description ="ID of the EC2 instance"
    value = aws_instance.app_server.id
}

output "instance_pub_ip" {
    description = "Public IP"
    value = aws_instance.app_server.public_ip
}