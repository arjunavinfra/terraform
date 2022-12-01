terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
 
 region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-store-arjun"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
