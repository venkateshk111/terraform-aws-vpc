provider "aws" {
  region = local.region
}

locals {
  region = "eu-north-1"
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../../../"

  name = "aws-snb-vpc-main"
  cidr = "10.0.0.0/20"

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  public_subnets  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Name       = "aws-snb-vpc-main"
    Creator    = "Venkatesh"
    Environment = "dev"
    CostCenter = "LUM1234"
  }

  vpc_tags = {
    Name       = "aws-snb-vpc-main"
    Creator    = "Venkatesh"
    Environment = "dev"
    CostCenter = "LUM1234"
  }
}
