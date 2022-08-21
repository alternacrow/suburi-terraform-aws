variable "REGION" {
  type        = string
  description = "REGION"
}

variable "VPC_CIDR_BLOCK" {
  type        = string
  description = "VPCのCIDR"
}

variable "SUBNET_A_CIDR" {
  type        = string
  description = "subnet aのCIDR"
}

variable "SUBNET_B_CIDR" {
  type        = string
  description = "subnet bのCIDR"
}

variable "SUBNET_C_CIDR" {
  type        = string
  description = "subnet cのCIDR"
}
