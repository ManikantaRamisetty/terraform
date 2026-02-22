provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-statefile-mani-1"
    key    = "prod/terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_instance" "myfirstinstance" {
  ami           = "ami-051a31ab2f4d498f5"
  instance_type = "t2.micro"
  tags = {
    Name = "backend-example1"
  }
}

resource "aws_instance" "mysecondinstance" {
  ami           = "ami-051a31ab2f4d498f5"
  instance_type = "t2.micro"
  tags = {
    Name = "backend-example2"
  }
}


output "instance_ids" {
  description = "List of EC2 instance IDs"
  value       = [aws_instance.myfirstinstance.id, aws_instance.mysecondinstance.id]
}

output "instance_names" {
  description = "List of EC2 instance names"
  value       = [aws_instance.myfirstinstance.tags.Name, aws_instance.mysecondinstance.tags.Name]
}
