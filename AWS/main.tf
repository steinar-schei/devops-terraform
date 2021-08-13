terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

resource "aws_instance" "app_server" {
  #ami           = "ami-0567085e558e02053"
  ami           = "ami-017ce4259c1c44cb2"
  instance_type = "t3.micro"

  tags = {
    Name = var.instance_name
  }
}
