data "aws_subnet" "private_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["private_subnet_2"]
  }
}

data "aws_subnet" "private_subnet_4" {
  filter {
    name   = "tag:Name"
    values = ["private_subnet_4"]
  }
}

data "aws_security_group" "rds_sg" {
  filter {
    name   = "tag:Name"
    values = ["rds_sg"]
  }
}