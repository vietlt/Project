variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "availability_zone" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}
 
variable "public_cird" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cird" {
  type    = list(any)
  default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "cidr_route" {
  type    = string
  default = "0.0.0.0/0"
}
