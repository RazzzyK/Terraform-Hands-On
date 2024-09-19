terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  # access_key = ""
  # secret_key = ""
}

# resource "aws_instance" "terraform_ec2" {
#     ami = "ami-0ebfd941bbafe70c6"
#     instance_type = "t2.micro"
#     tags = {"Name" = "terraform-instance2"}
#     key_name = "projectkey"
#     vpc_security_group_ids = [aws_security_group.security_group.id]
# }

# resource "aws_security_group" "security_group" {
#   name = "ssh-security-group"
#   tags = {
#     "Name" = "ec2-security-group"
#   }
#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_instance" "terraform_ec2" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  key_name      = "projectkey"
  tags = {
    "Name" = "tf-ec2"
  }

}

resource "aws_s3_bucket" "s3" {
  bucket = "my-tf-test-bucket-123456123456123456"
}

# resource "aws_s3_bucket" "s3_2" {
#   bucket = "my-tf-test-bucket-1234561234561234561"
# }

# Will be shown when terraform apply or terraform output
output "ec2_public_ip" {
  value = aws_instance.terraform_ec2.public_ip
}

output "s3_bucket" {
  value = aws_s3_bucket.s3.id
}

# terraform init
# terraform fmt
# terraform validate
# terraform plan
# terraform apply
# terraform console
# terraform apply --refresh-only
# terraform output