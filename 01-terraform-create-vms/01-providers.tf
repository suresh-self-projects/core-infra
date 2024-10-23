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
  access_key = "AKIAVRUVWEQF7SKBBPVU"
  secret_key = "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"

}