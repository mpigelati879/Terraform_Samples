variable "Taccess_key" {
  default = ""
}

variable "Tsecret_key" {
  default = ""
}

variable "azs" {
  type = "list"
  default = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f"]
}

variable "vpc-cidr_block" {
  default = "192.168.0.0/16"
}

variable "subnet-cidr_block" {
  type = "list"
  default = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24","192.168.5.0/24","192.168.6.0/24",]
}
