#AWS EC2

resource "aws_instance" "mywebserver" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [ aws_security_group.nginx-sg.id ]
  associate_public_ip_address = true 

user_data = <<-EOF
            #!/bin/bash
            sudo apt-get update -y
            sudo apt install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "mywebserver"
  }
}