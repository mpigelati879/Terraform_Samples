resource "aws_instance" "salesinstance" {
  #ami           = "ami-04b9e92b5572fa0d1"
  ami           = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  subnet_id     = ""
}
