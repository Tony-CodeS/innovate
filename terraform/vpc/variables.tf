variable "project_name" {
  description = "The name of the project. Used for tagging and naming resources."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "The AWS region to deploy the VPC into."
  type        = string
  default     = "eu-west-1"
}
