resource "aws_instance" "example" {
  ami           = var.ami[var.region]
  instance_type = "t2.micro"
}