provider "aws" {
  region = "eu-central-1"
}

# Взима последния Amazon Linux 2 AMI за региона
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# EC2 instance
resource "aws_instance" "ec2testterraform" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro" # или t3.micro

  tags = {
    Name = "ec2testterraform"
  }
}
