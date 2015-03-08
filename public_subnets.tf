/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

/* Public subnets */
resource "aws_subnet" "public_a" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_a_cidr}"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default"]
  tags { 
    Name = "public_a" 
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_b_cidr}"
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default"]
  tags { 
    Name = "public_b" 
  }
}

resource "aws_subnet" "public_d" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_d_cidr}"
  availability_zone = "${var.region}d"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default"]
  tags { 
    Name = "public_d" 
  }
}

resource "aws_subnet" "public_e" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_e_cidr}"
  availability_zone = "${var.region}e"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default"]
  tags { 
    Name = "public_e" 
  }
}

/* Routing table for all public subnets */
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
}

/* Associate the routing table to public subnet */
resource "aws_route_table_association" "public_a" {
  subnet_id = "${aws_subnet.public_a.id}"
  route_table_id = "${aws_route_table.public.id}"
}