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

variable "images" {
  type = "map"

  default = {
    us-east-1 = "ami-07ebfd5b3428b6f4d"
    us-west-2 = "ami-0fc025e3171c5a1bf"
  }
}

variable "ec2" {
  type = "map"

  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.micro"
}
}


# Declare the data source
data "aws_availability_zones" "azs" {}
