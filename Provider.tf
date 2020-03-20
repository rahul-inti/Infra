provider "aws" {
  region = "${var.region}"

}
assume_role {
  role_arn = "arn:aws:iam::141570103273:role/Terraform"
  }
