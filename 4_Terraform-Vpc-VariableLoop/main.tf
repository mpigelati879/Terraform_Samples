resource "aws_vpc" "testing" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags {
    Name     = "testing"
    location = "Hydrabad"
  }
}

resource "aws_subnet" "testing_subnet" {
  vpc_id     = "${aws_vpc.testing.id }"
  cidr_block = "192.168.1.0/24"

  tags {
    name = "test_subnet"
  }
}
