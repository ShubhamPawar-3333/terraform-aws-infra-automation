variable "aws_region" {
  description = "AWS region for dev"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for dev VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for dev public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for dev private subnet"
  default     = "10.0.2.0/24"
}

variable "key_name" {
  description = "SSH key pair name for dev Bastion"
  type        = string
}