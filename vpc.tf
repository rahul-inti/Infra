resource "aws_vpc" "prod" {
  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "${var.tenancy}"
  enable_dns_support   = "${var.dns}"
  enable_dns_hostnames = "${var.hostnames}"

  tags {
    Name  = "${var.tags}"
    stack = "${var.tags1}"
  }
}

resource "aws_subnet" "Publicsubnet" {
  count             = 3
  vpc_id            = "${aws_vpc.prod.id}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  cidr_block        = "${cidrsubnet(var.cidr_block,8,count.index)}"

  tags {
    Name = "public-${count.index + 0}"
  }
}

resource "aws_subnet" "Privatesubnet" {
  count             = 3
  vpc_id            = "${aws_vpc.prod.id}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  cidr_block        = "${cidrsubnet(var.cidr_block,8,count.index + 2)}"

  tags {
    Name  = "Private-${count.index + 0}"

  }
}
