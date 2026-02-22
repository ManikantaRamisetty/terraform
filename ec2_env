provider "aws" {
  region = "ap-south-1"
}
locals {
 instance_types = {
  dev   = "t2.micro"
  test  = "t3.micro"
  prod  = "t2.medium"
 }
}

resource "aws_instance" "workspace-example" {
  ami= "ami-051a31ab2f4d498f5"
  instance_type= local.instance_types[terraform.workspace]
  tags = {
    Name = "${terraform.workspace}-server"
  }

}

output "active_workspace" {
  description = "Current Terraform workspace"
  value       = terraform.workspace
}

output "selected_instance_type" {
  description = "Instance type selected for the current workspace"
  value       = local.instance_types[terraform.workspace]
}
