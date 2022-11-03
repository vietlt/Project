data "aws_subnet" "public_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["public_subnet_1"]
  }
}

data "aws_subnet" "public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["public_subnet_2"]
  }
}

data "aws_subnet" "private_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["private_subnet_1"]
  }
}

data "aws_subnet" "private_subnet_3" {
  filter {
    name   = "tag:Name"
    values = ["private_subnet_3"]
  }
}

data "aws_security_group" "nodes_sg" {
  filter {
    name   = "tag:Name"
    values = ["nodes_sg"]
  }
}

data "aws_security_group" "alb_sg" {
  filter {
    name   = "tag:Name"
    values = ["alb_sg"]
  }
}
