output "instance_public_ip" {
  description = "The Public IP of EC2"
  value = aws_instance.mywebserver.public_ip
}


output "instance_url" {
  description = "The URL to access Nginx Server"
  value = "http://${aws_instance.mywebserver.public_ip}"
}