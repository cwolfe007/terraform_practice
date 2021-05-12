provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    "Name" = var.instance_name
    "ANewTag" = "wow such change"
  }
}

