########################
# EC2 Security Group
########################

resource "aws_security_group" "ec2_sg" {
  name = "showgo-ec2-sg"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "FastAPI App"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################
# EC2 Instance
########################

resource "aws_instance" "showgo_server" {

  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.small"
  key_name      = "new"

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "showgo-server"
  }
}