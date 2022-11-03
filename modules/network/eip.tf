resource "aws_eip" "eip" {
  vpc = true

  tags = {
    Name = "natgw-ip"
  }
}