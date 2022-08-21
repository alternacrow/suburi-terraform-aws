locals {
  region = "us-west-2"
}

provider "aws" {
  region = local.region
}

module "network" {
  source = "../../modules/network"

  REGION = local.region

  VPC_CIDR_BLOCK = "10.99.0.0/16"
  SUBNET_A_CIDR  = "10.99.1.0/24"
  SUBNET_B_CIDR  = "10.99.2.0/24"
  SUBNET_C_CIDR  = "10.99.3.0/24"
}
