// Create public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cird[1]
  map_public_ip_on_launch = "true" //Makes subnet public
  availability_zone       = var.availability_zone[1]
  tags = {
    Name = "public_subnet_2"
  }
}