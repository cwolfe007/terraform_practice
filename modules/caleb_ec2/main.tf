provider "aws" {
  profile = "default"
  region  = var.region
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

output "name" {
    description ="ID of the EC2 instance"
    value = var.instance_name
}

output "instance_pub_ip" {
    description = "Public IP"
    value = aws_instance.app_server.public_ip
}