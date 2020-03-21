resource "aws_instance" "dominose" {
  ami           = var.images
  instance_type = var.ec2
}
