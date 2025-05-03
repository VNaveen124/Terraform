provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance" {
  ami           = "ami-0f9de6e2d2f067fca"
  instance_type = "t2.micro"
  count         = length(var.instance_name)
  tags = {
    Name = var.instance_name[count.index]
  }
}

variable "instance_name" {
  default = ["nav1", "nav2", "na3"]
}
