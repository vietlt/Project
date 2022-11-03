

variable "instance_types" {
  description = "Instance type to create an instance"
  type        = list
  default     = ["t3.micro"]
}


variable "ami_id" {
  description = "ami id"
  type        = string
  default     = "ami-08c40ec9ead489470"
}

variable "bastion_type" {
  description = "Instance type to create an instance"
  type        = string
  default     = "t2.micro"
}