// Create balancer security group
resource "aws_security_group" "alb_sg" {
  name        = "alb"
  description = "allow all"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "alb_sg"
  }
}

// Create nodes security group
resource "aws_security_group" "nodes_sg" {
  description = "Allows ALB to access the cluster"
  name        = "nodes_sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    # security_groups = [aws_security_group.alb_sg.id]
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   security_groups = [aws_security_group.alb_sg.id]
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${var.cidr_route}"]
  }

  tags = {
    Name = "nodes_sg"
  }
}

// Create rds security group
resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allows application to access the RDS instances"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.nodes_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.cidr_route}"]
  }
  tags = {
    Name = "rds_sg"
  }
}
