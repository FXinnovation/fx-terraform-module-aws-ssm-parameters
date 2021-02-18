terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.47"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}
