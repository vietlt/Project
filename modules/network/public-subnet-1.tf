// Create public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cird[0]
  map_public_ip_on_launch = "true" //Makes subnet public
  availability_zone       = var.availability_zone[0]
  tags = {
    Name = "public_subnet_1"
  }
}