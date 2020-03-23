resource "aws_instance" "dominose" {
  ami           = "${lookup(var.images,var.region)}"
  instance_type = "${lookup(var.ec2,var.region)}"
}
