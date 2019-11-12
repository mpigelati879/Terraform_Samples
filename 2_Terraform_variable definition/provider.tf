provider "aws" {
  access_key = "${var.Taccess_key}"
  secret_key = "${var.Tsecret_key}"
  region     = "${var.Tregion}"
}
