#--------------------------------------
# Teraform Providers Block
#--------------------------------------
terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#--------------------------------------
# Configure the AWS Provider
#--------------------------------------
provider "aws" {
  region = var.region
} 