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

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH into the instance"
  type        = string
}

variable "bucket_name" {
  description = "Globally unique name for s3 bucket"
  type        = string
}
