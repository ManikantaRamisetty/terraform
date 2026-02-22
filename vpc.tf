provider "aws" {
  region = "ap-south-1"
}
locals {
  env = terraform.workspace
}

resource "aws_vpc" "vpc_1" {
  cidr_block="192.168.0.0/16"
  tags = {
    Name = "${local.env}-vpc"
  }

}

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.vpc_1.id
  cidr_block="192.168.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "${local.env}-subnet"
  }
}


resource "aws_instance" "ec2" {
  subnet_id = aws_subnet.subnet_1.id
  ami           = "ami-051a31ab2f4d498f5"
  instance_type = "t2.micro"
  tags = {
    Name = "${local.env}-server"
  }
}
