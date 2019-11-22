resource "aws_key_pair" "terraform_ec2_key" {
  key_name   = "terraform_ec2_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDltls1T9H2w+Wnltx3fWweEq9wML3J7P7Ixn+y1zM0ucSojskVokTWTIYlxBEsxNEejwvaKdB+jV9AWBeH4DVJZq3R1dCnGUaxhF8B5sHq2VWkLyKUeAfZV437VoWfixbGbt5BVpaCe9nj/qv9ThwD7iM1Xeg6HKSAKjTkRm9VNfAPBnOsqD0EJywqVgu9pi0dXMggAK4zyCAEOt28t43cndMKYLWipON/YI8c/VUYAspGVtyKphee3NPmy6V9iJTajKSlLA1cNSpMOKXikcapPGoSScEJZJLCOroMZLE13mpfJslP7wsh/FOmV1Z5X2BFR6ByshOy/4fOfmWFLewX mohan@mohan"
    # we can copy the entire key or using file we can  for adding ssk key to Ec2 instance
  //public_key = "${file("terraform_ec2_key.pub")}"
}

resource "aws_instance" "my_instance" {
  ami           = "${var.Tami}"
  instance_type = "${var.Tinstance}"

  #key_name = "tfdemo"
  key_name = "${aws_key_pair.terraform_ec2_key.key_name}"
  user_data = <<EOF
            sudo apt-get update
            sudo apt install openjdk-8-jre-headless -y
            java -version
            wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
            echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
            sudo apt-get update
            sudo apt-get install jenkins -y
            sudo systemctl status jenkins
            sudo ufw allow 8080
            sudo ufw status
            sudo ufw enable

  EOF

  #security_groups = ["sg-02430b5d220d54bed"]
  vpc_security_group_ids = ["sg-02430b5d220d54bed"]

  tags {
    Name  = "Terrarotm1"
    batch = "7 Pm "
  }
}
