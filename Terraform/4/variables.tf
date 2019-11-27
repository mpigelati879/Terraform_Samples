variable "aws_access_key" {}
variable "aws_secret_key"{}
variable "aws_region"{}

variable "vpc_cidr" {}
variable "vpc_name" {}

variable "subnet_cidr" {
  type = "list"
  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
}

variable "subnet_region" {
  type = "list"
  default = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f"]
}
