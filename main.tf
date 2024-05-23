provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "eu-north-1"
}

resource "aws_instance" "EmptyInstance" {
  ami           = "ami-0705384c0b33c194c"
  instance_type = "t3.micro"
  key_name      = "my-key-pair"

  tags = {
    Name = "MyEmptyInstance"
  }

  security_groups = ["web-sg"]
}

resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
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