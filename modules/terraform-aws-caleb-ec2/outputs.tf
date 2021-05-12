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