resource "aws_vpc" "testing" {
  cidr_block       = "${var.vpc-cidr_block}"
  instance_tenancy = "default"

  tags {
    Name     = "Project1_Test"
    location = "Hydrabad"
  }
}

resource "aws_subnet" "testing_subnet" {
  count = "${length(var.azs)}"
  vpc_id = "${aws_vpc.testing.id }"
  cidr_block = "${element(values(var.subnets,count.index))}"
  availability_zone = "${element(keys(var.subnets,count.index))}"

}
