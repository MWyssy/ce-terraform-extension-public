terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "terraform_extension"
  cidr = "172.31.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["172.31.1.0/24", "172.31.3.0/24", "172.31.5.0/24"]
  public_subnets  = ["172.31.0.0/24", "172.31.2.0/24", "172.31.4.0/24"]

  enable_nat_gateway = true

  public_dedicated_network_acl = true
  manage_default_network_acl   = true
  public_inbound_acl_rules = [
    {
      rule_number = 200
      rule_action = "allow"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
    },
    {
      rule_number     = 201
      rule_action     = "allow"
      protocol        = "-1"
      from_port       = 0
      to_port         = 0
      ipv6_cidr_block = "::/0"
    }
  ]

}

