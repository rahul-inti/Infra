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
  cidr_block        = "${cidrsubnet(var.cidr_block,8,count.index + 1}"

  tags {
    Name = "public-${count.index + 0}"
  }
}

resource "aws_subnet" "Privatesubnet" {
  count             = 3
  vpc_id            = "${aws_vpc.prod.id}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  cidr_block        = "${cidrsubnet(var.cidr_block,8,count.index + 4)}"

  tags {
    Name  = "Private-${count.index + 0}"

  }
}


resource "aws_internet_gateway" "igw" {
  count  = 1
  vpc_id = "${aws_vpc.prod.id}"

  tags {
    Name = "${var.tags1}"
  }
}

resource "aws_eip" "nat" {
  count = 1
  vpc   = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${element(aws_subnet.Publicsubnet.*.id, count.index)}"

  depends_on = ["aws_internet_gateway.igw"]

  #tags {
    #Name = "gw NAT"
  #}
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.prod.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "public Subnet"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.prod.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.gw.id}"
  }

  tags {
    Name = "private Subnet"
  }
}
