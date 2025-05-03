provider "aws" {
  region = "us-east-1"  # Change as needed
}

# All VPCs
data "aws_vpcs" "all" {}

data "aws_vpc" "details" {
  for_each = toset(data.aws_vpcs.all.ids)
  id       = each.key
}

# All Subnets
data "aws_subnets" "all" {}

data "aws_subnet" "details" {
  for_each = toset(data.aws_subnets.all.ids)
  id       = each.key
}

# All Route Tables
data "aws_route_tables" "all" {}

# All Security Groups
data "aws_security_groups" "all" {}

data "aws_security_group" "details" {
  for_each = toset(data.aws_security_groups.all.ids)
  id       = each.key
}

# NAT Gateways
data "aws_nat_gateways" "all" {
  filter {
    name   = "state"
    values = ["available"]
  }
}

# Outputs

output "vpcs" {
  value = {
    for id, vpc in data.aws_vpc.details : id => {
      cidr_block = vpc.cidr_block
      tags       = try(vpc.tags, {})
    }
  }
}

output "subnets_with_tags" {
  value = {
    for id, s in data.aws_subnet.details : id => {
      vpc_id     = s.vpc_id
      cidr_block = s.cidr_block
      tags       = try(s.tags, {})
    }
  }
}

output "route_tables" {
  value = data.aws_route_tables.all.ids
}

output "security_groups_with_tags" {
  value = {
    for id, sg in data.aws_security_group.details : id => {
      name       = sg.name
      description = sg.description
      vpc_id     = sg.vpc_id
      tags       = try(sg.tags, {})
    }
  }
}

output "nat_gateway_ids" {
  value = data.aws_nat_gateways.all.ids
}









/*



Outputs:

nat_gateway_ids = tolist([])
route_tables = tolist([
  "rtb-027739c9a6ff6a1d0",
  "rtb-012b0fa19581d38f7",
  "rtb-06b81a609672622d4",
  "rtb-082bad42b52d560c3",
  "rtb-073b45bc8351ef6b3",
  "rtb-043fc08ac0567bc0d",
  "rtb-000fbad1242576528",
])
security_groups_with_tags = {
  "sg-0125e2d5b8b99093e" = {
    "description" = "launch-wizard-6 created 2025-04-18T08:28:24.699Z"
    "name" = "launch-wizard-6"
    "tags" = tomap({})
    "vpc_id" = "vpc-08a0e4292321b323f"
  }
  "sg-01a63d30fc668d4f1" = {
    "description" = "launch-wizard-2 created 2025-04-17T07:33:14.113Z"
    "name" = "launch-wizard-2"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "sg-01ee573580b521404" = {
    "description" = "default VPC security group"
    "name" = "default"
    "tags" = tomap({})
    "vpc_id" = "vpc-08a0e4292321b323f"
  }
  "sg-0338cfeff8b6e7520" = {
    "description" = "launch-wizard-1 created 2025-04-17T06:50:49.318Z"
    "name" = "launch-wizard-1"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "sg-040a1aa915c063509" = {
    "description" = "default VPC security group"
    "name" = "default"
    "tags" = tomap({})
    "vpc_id" = "vpc-0bcd2b9eaed01a010"
  }
  "sg-0443fa6ebdf9110ba" = {
    "description" = "launch-wizard-3 created 2025-04-17T07:41:33.828Z"
    "name" = "launch-wizard-3"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "sg-063d1f05d126c8209" = {
    "description" = "launch-wizard-7 created 2025-04-21T09:10:44.060Z"
    "name" = "launch-wizard-7"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "sg-07efed7b4fe897c4d" = {
    "description" = "launch-wizard-8 created 2025-04-22T16:14:26.181Z"
    "name" = "launch-wizard-8"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "sg-0aacd5da9910dff43" = {
    "description" = "default VPC security group"
    "name" = "default"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "sg-0c1674e226498a909" = {
    "description" = "launch-wizard-5 created 2025-04-18T08:25:16.468Z"
    "name" = "launch-wizard-5"
    "tags" = tomap({})
    "vpc_id" = "vpc-08a0e4292321b323f"
  }
  "sg-0f182c763dac8ae13" = {
    "description" = "launch-wizard-4 created 2025-04-17T18:11:21.565Z"
    "name" = "launch-wizard-4"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
}
subnets_with_tags = {
  "subnet-01e09be53bdd46651" = {
    "cidr_block" = "172.0.0.0/28"
    "tags" = tomap({
      "Name" = "Personal-Private-Subnet-01"
    })
    "vpc_id" = "vpc-08a0e4292321b323f"
  }
  "subnet-03800d9c79120e329" = {
    "cidr_block" = "192.168.0.0/26"
    "tags" = tomap({
      "Name" = "Personal-Public-Subnet-02"
    })
    "vpc_id" = "vpc-0bcd2b9eaed01a010"
  }
  "subnet-0408d246aef252a54" = {
    "cidr_block" = "172.31.32.0/20"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "subnet-055ab21661df6b44b" = {
    "cidr_block" = "172.0.0.16/28"
    "tags" = tomap({
      "Name" = "Personal-Public-Subnet-01"
    })
    "vpc_id" = "vpc-08a0e4292321b323f"
  }
  "subnet-05b4818fb251b2efb" = {
    "cidr_block" = "172.0.0.32/28"
    "tags" = tomap({
      "Name" = "Personal-Public-Subnet-11"
    })
    "vpc_id" = "vpc-08a0e4292321b323f"
  }
  "subnet-08efd060ee436a477" = {
    "cidr_block" = "172.31.80.0/20"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "subnet-0affce5c4afd3950f" = {
    "cidr_block" = "172.31.0.0/20"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "subnet-0baca18c64efb7820" = {
    "cidr_block" = "172.31.16.0/20"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "subnet-0c99f9a0a94d93e94" = {
    "cidr_block" = "192.168.0.64/26"
    "tags" = tomap({
      "Name" = "Personal-Private-Subnet-02"
    })
    "vpc_id" = "vpc-0bcd2b9eaed01a010"
  }
  "subnet-0dbc0d0b5bb2fe47a" = {
    "cidr_block" = "172.31.64.0/20"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
  "subnet-0f218f27d939edfa2" = {
    "cidr_block" = "172.31.48.0/20"
    "tags" = tomap({})
    "vpc_id" = "vpc-078a33bb7c250aa58"
  }
}
vpcs = {
  "vpc-078a33bb7c250aa58" = {
    "cidr_block" = "172.31.0.0/16"
    "tags" = tomap({})
  }
  "vpc-08a0e4292321b323f" = {
    "cidr_block" = "172.0.0.0/28"
    "tags" = tomap({
      "Name" = "Personalvpc-1"
    })
  }
  "vpc-0bcd2b9eaed01a010" = {
    "cidr_block" = "192.168.0.0/25"
    "tags" = tomap({
      "Name" = "Personalvpc-2"
    })
  }
}



*/
