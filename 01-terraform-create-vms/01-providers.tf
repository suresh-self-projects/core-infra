terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  access_key = ""
  secret_key = ""

}