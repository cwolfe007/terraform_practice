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

