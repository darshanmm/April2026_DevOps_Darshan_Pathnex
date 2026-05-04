variable "region" {
    default = "us-east-1"
}
variable "instance_type" {
    default = "c5.xlarge"
}
variable "allowed_ssh_ip" {
    description = "Your IP for SSH"
}