provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_app_server" {
  ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI (update if necessary)
  instance_type = "t2.micro"

  tags = {
    Name = "DevOpsAppServer"
  }
}
