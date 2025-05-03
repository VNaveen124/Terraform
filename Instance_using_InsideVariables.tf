provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "naveeninst" {
  ami           = var.inst_ami
  instance_type = var.inst_type
  count         = var.inst_count

  tags = {
    name = var.inst_tags
  }

}

variable "inst_type" {
  type    = string
  default = "t2.micro"
}

variable "inst_ami" {
  type    = string
  default = "ami-0f9de6e2d2f067fca"
}
variable "inst_count" {
  type    = number
  default = 2
}

variable "inst_tags" {
  type    = string
  default = "dev"
}
