variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for public subnet"
  type = string
}

variable "aws_region" {
  description = "AWS region for resources"
  type = string
}