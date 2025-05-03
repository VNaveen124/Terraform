provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

resource "aws_s3_bucket" "naveenusverginia" {
  provider = aws
  bucket   = "naveenusverginia"
}

resource "aws_s3_bucket" "naveenmumbai" {
  provider = aws.mumbai
  bucket   = "naveenmumaibucket123"
}

