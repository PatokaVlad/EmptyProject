provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "eu-north-1"
}

resource "aws_instance" "EmptyInstance" {
  ami           = "ami-0705384c0b33c194c"
  instance_type = "t3.micro"
}
