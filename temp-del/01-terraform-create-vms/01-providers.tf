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
  access_key = "AKIAZQ3DORHJ53OEONYI"
  secret_key = "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"

}