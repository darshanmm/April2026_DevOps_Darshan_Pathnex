variable "aws_region" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "prod-ec2"
}

variable "key_name" {
  description = "AWS EC2 Key Pair Name"
}

variable "allowed_ssh_ip" {
  description = "Your public IP"
}
