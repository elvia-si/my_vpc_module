# VPC
variable "vpc_cidr" {
  description = "The CIDR of the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

# REGION
variable "region" {
  description = "Default region for the VPC"
  type        = string
}

# INTERNET GATEWAY
variable "internet_gw_name" {
  description = "The name of Internet Gateway"
  type        = string
}


# SUBNET
#PUBLIC SUBNET
variable "public_cidr_a" {
  description = "CIDR of the public Subnet"
  type        = string
}

variable "public_name" {
  description = "Public access to Kabana"
  type        = string
}

# #PRIVATE SUBNET
# variable "private_cidr_a" {
#   description = "CIDR of the private Subnet"
#   type        = string
# }

