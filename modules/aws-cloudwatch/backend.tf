
#-------------------
# Backend
#-------------------
terraform {
  backend "s3" {
    bucket = "cloudwatch-terraform-state"
    key    = "resources/cloudwatch/terraform.tfstate"
    region = "us-east-1"
  }
}


