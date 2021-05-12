terraform {
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