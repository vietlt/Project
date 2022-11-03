# resource "tls_private_key" "standard" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "generated_key" {
#   key_name   = "key_name"
#   public_key = tls_private_key.standard.public_key_openssh
# }