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
  access_key = "AKIAR6HSDZJV5D2MKJW4"
  secret_key = "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"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08f7912c15ca96832"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
