provider "aws" {
  access_key = "AKIAVS4FZVJMMCJ3MN5O"
  secret_key = "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"
  region     = "us-east-1"
}


# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = "terraform-remote-state-storage-s3"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags {
      Name = "S3 Remote Terraform State Store"
    }
}