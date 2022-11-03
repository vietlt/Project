//
resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_cird[2]
  availability_zone       = var.availability_zone[1]
  tags = {
    Name = "private_subnet_3"
  }
}