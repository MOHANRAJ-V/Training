terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = "AKIAY03HLYWBP4UY6AWT"
  secret_key = "+cRckQKMUUWgPDFQtPeTz6PvcCiT8THmoKVW/4Cv"
  region  = "eu-north-1"
}

resource "aws_instance" "jenkins-ec2" {
  ami           = "ami-00381a880aa48c6c6"
  instance_type = "t3.micro" 
  key_name      = "Tesing"
  //user_data     = file(install_jenkins.sh)

  tags = {
    Name = "ExampleJenkinsInstance"
  }
}
#Create security group 
resource "aws_security_group" "myjenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow inbound ports 22 and 8080"
  vpc_id      = "vpc-03774359ae7ff4e8c"

  #Allow incoming TCP requests on port 22 from any IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#Allow incoming TCP requests on port 443 from any IP
  ingress {
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow incoming TCP requests on port 8080 from any IP
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

