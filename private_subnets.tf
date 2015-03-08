/* Private subnet */
resource "aws_subnet" "private_a" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_subnet_a_cidr}"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false
  depends_on = ["aws_instance.nat_a"]
  tags { 
    Name = "private_a" 
  }
}

/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.nat_a.id}"
  }
}

/* Associate the routing table to private subnet */
resource "aws_route_table_association" "private_a" {
  subnet_id = "${aws_subnet.private_a.id}"
  route_table_id = "${aws_route_table.private.id}"
}