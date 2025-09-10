variable "project_name" {}
variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}
variable "cluster_role_arn" {}
variable "node_role_arn" {}
variable "region" {
  default = "eu-west-1"
}
