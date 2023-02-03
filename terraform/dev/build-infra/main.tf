terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ecr" {
	source           = "../../modules/ecr"
	ecr_name         = var.ecr_name
	tags             = var.tags
	image_mutability = var.image_mutability
}