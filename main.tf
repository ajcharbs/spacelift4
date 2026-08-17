
provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  default = "demo"
}

locals {
  env = coalesce(var.environment, "unknown")
}

resource "aws_s3_bucket" "data" {
  bucket_prefix = "orbit-labs-"

  tags = {
    name        = "Orbit Labs Storage"
    managedBy   = "Spacelift"
    environment = var.environment
    project     = "orbit-labs"
    temp        = "temp2"
  }

}

output "bucket_name" {
  value = aws_s3_bucket.data.id
}

output "deploy_env" {
  value = local.env
}
