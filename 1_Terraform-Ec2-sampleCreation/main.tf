resource "aws_instance" "salesinstance" {
  ami           ="ami-0c64dd618a49aeee8"
  #ami           ="ami-0bba96c31d87e65d9"
  instance_type = "t2.micro"
  subnet_id     = ""
}
