resource "aws_vpc" "testing" {
  cidr_block       = "${var.vpc-cidr_block}"
  instance_tenancy = "default"

  tags {
    Name     = "testing"
    location = "Hydrabad"
  }
}

resource "aws_subnet" "testing_subnet" {
  vpc_id     = "${aws_vpc.testing.id }"
  cidr_block = "${var.subnet-cidr_block}"

  tags {
    name = "test_subnet"
  }
}
