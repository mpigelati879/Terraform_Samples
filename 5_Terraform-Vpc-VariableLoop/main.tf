resource "aws_vpc" "testing" {
  cidr_block       = "${var.vpc-cidr_block}"
  instance_tenancy = "default"

  tags {
    Name     = "testing"
    location = "Hydrabad"
  }
}

resource "aws_subnet" "testing_subnet" {
  count =   "${length(var.azs)}"
  vpc_id     = "${aws_vpc.testing.id }"
  cidr_block = "${element(var.subnet-cidr_block,count.index)}"

  tags {
    name = "test_subnet"
  }
}
