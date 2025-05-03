provider "aws" {
  region = "us-east-1"
}

/*
module "vpc" {
  source = "./modules/vpc_module"
}

module "ec2" {
  source = "./modules/ec2_module"
}

module "s3" {
  source = "./modules/s3_module"
}

*/



module "vpc" {
  source = "https://naveenmodulec03052025.s3.us-east-1.amazonaws.com/modules/vpc_module/vpc.tf.zip"
}

module "ec2" {
  source = "https://naveenmodulec03052025.s3.us-east-1.amazonaws.com/modules/ec2_module/ec2.tf.zip"
}

module "s3" {
  source = "https://naveenmodulec03052025.s3.us-east-1.amazonaws.com/modules/s3_module/s3.tf.zip"
}








cat modules/ec2_module/main.tf
resource "aws_instance" "instance" {
  ami           = "ami-0f9de6e2d2f067fca"
  instance_type = "t2.micro"
  tags = {
    Name = "naveen"
  }
}


cat modules/s3_module/main.tf
resource "aws_s3_bucket" "bucket" {
  bucket = "naveens3bucketmar25"
}

cat modules/vpc_module/main.tf
resource "aws_vpc" "main" {
  cidr_block = "10.0.1.0/16"
  tags = {
    Name = "module-vpc"
  }
}
