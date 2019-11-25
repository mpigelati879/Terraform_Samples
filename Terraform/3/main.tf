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

resource "aws_subnet" "subnet1_public_name" {
  cidr_block = "${var.subnet1_public_cidr}"
  vpc_id = "${aws_vpc.Testing.id}"
  availability_zone = "us-east-1a"
  tags = {
        Name="${var.subnet1_public_name}"
  }
}

resource "aws_subnet" "subnet2_public_name" {
  cidr_block = "${var.subnet2_public_cidr}"
  vpc_id = "${aws_vpc.Testing.id}"
  availability_zone = "us-east-1b"
  tags = {
        Name="${var.subnet2_public_name}"
  }
}
resource "aws_subnet" "subnet3_public_name" {
  cidr_block = "${var.subnet3_public_cidr}"
  vpc_id = "${aws_vpc.Testing.id}"
  availability_zone = "us-east-1c"
    tags = {
        Name="${var.subnet3_public_name}"
  }

}
resource "aws_subnet" "subnet_private" {
  cidr_block = "${var.subnet_privare_cidr}"
  vpc_id = "${aws_vpc.Testing.id}"
  availability_zone = "us-east-1a"
    tags = {
        Name="${var.subnet_privare_name}"
  }
}

# create a dynamodb table for locking the state file

terraform{
  backend "s3" {
    bucket = "mohasnais3"
    region = "us-east-1"
    key = "terraform.state"
  }
}
