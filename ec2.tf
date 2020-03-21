resource "aws_instance" "dominose" {
  ami           = "${var.images}" # us-west-2
  instance_type = "${var.ec2}"
  region = "${var.region}"
}
