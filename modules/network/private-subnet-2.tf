//
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_cird[1]
  availability_zone       = var.availability_zone[0]
  tags = {
    Name = "private_subnet_2"
  }
}