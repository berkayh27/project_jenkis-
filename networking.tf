resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.Team1.id}"
  tags {
    name = "jenkings"
  }
}

resource "aws_route_table" "public_r" {
  vpc_id = "${aws_vpc.Team1.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.public_r.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.public_r.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.public3.id}"
  route_table_id = "${aws_route_table.public_r.id}"
}
