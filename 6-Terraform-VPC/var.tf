module "cluster" {
  source = "github.com/dwmkerr/terraform-aws-vpc  "
  subnets           = {
    us-east-1a = "192.168.1.0/24"
    us-east-1b = "192.168.1.0/24"
    us-east-1c = "192.168.1.0/24"
  }
}

variable "Taccess_key" {
  default = "AKIAVS4FZVJMMCJ3MN5O"
}

variable "Tsecret_key" {
    default = "RwnjB7Rp0jCv3Aikkd7kVfS2mMko7IAlACmNn0JN"
}

variable "azs" {
  type = "list"
  default = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f"]
}

variable "vpc-cidr_block" {
  default = "192.168.0.0/16"
}

variable "subnets" {
  type = "map"

}
