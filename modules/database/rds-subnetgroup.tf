resource "aws_db_subnet_group" "subnetgroup" {
  name       = "miniproject-subnetgroup"
  subnet_ids = [data.aws_subnet.private_subnet_2.id, data.aws_subnet.private_subnet_4.id]

  tags = {
    Name = "subnetgroup"
  }
}