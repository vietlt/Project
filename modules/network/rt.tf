// Configure route table
resource "aws_route_table" "rt-ig" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "rt-ig"
  }
}

// Configure route table nat gateway
resource "aws_route_table" "rt-nat" {
  depends_on = [aws_nat_gateway.nat_gateway]
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.cidr_route
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "rt-nat"
  }
}

// Associate public and NAT
resource "aws_route_table_association" "crta_public_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.rt-ig.id
}

resource "aws_route_table_association" "crta_public_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.rt-ig.id
}

// Associate private
resource "aws_route_table_association" "crta_private_1" {
  depends_on = [aws_route_table.rt-nat]
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.rt-nat.id
}

resource "aws_route_table_association" "crta_private_2" {
  depends_on = [aws_route_table.rt-nat]
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.rt-nat.id
}
