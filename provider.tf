# provider "aws" {
#   region = "eu-west-1"
# }

# provider "aws" {
#   alias  = "east"
#   region = "us-east-1"
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
      configuration_aliases = [ aws.east ]
    }
  }
}