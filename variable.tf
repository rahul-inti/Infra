variable "region" {
  description = "The AWS region"
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "This for vpc cide block"
  default     = "10.0.0.0/16"
}

variable "tenancy" {
  default = "dedicated"
}

variable "dns" {
  default = "true"
}

variable "tags" {
  default = "prod"
}

variable "tags1" {
  default = "rahul"
}

variable "hostnames" {
  default = "true"
}

# Declare the data source
data "aws_availability_zones" "azs" {}
