variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "project_name" {
  description = "Name prefix used for tagging and naming"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
