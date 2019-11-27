provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region  }"
}

resource "aws_vpc" "Testing" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name="${var.vpc_name}"
  }
}

resource "aws_subnet" "create" {
  count = length(var.subnet_region)
  vpc_id = "${aws_vpc.Testing.id}"
  cidr_block = element(var.subnet_cidr,count.index)
  availability_zone = element(var.subnet_region,count.index)
  map_public_ip_on_launch = true
  #  availability_zone = "us-east-1a"
  tags = {
        Name="Private_subnet-${count.index+1}"
  }
}



