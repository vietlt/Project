// Create EC2
resource "aws_instance" "instance" {
  ami             = var.ami_id
  instance_type   = var.bastion_type
  subnet_id       = data.aws_subnet.public_subnet_1.id
  security_groups = [data.aws_security_group.alb_sg.id]
  key_name = "project-key-us-east-1"
  tags = {
    "Name" = "bastion-host"
  }
}