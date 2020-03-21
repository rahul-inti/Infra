resource "aws_instance" "dominose" {
  ami           = "${map(var.images)}"
  instance_type = "${map(var.ec2)}"
}
