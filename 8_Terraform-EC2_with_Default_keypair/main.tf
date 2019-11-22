resource "aws_instance" "my_instance" {
  ami           = "${var.Tami}"
  instance_type = "${var.Tinstance}"
  key_name = "TMohansai"
  #security_groups = ["sg-02430b5d220d54bed"]
  vpc_security_group_ids = ["sg-02430b5d220d54bed"]
  tags {
    Name  = "Terrarotm"
    batch = "7 Pm "
  }
}
