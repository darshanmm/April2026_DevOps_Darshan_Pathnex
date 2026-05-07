provider "aws"{
    region = "us-east-1"
}
resource "aws_security_group" "Pathnex SG" {
    name = "PathnexSG"
    description = "Pathnex SG for SSH"

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "PathnexEC2" {
    ami = "ami_0abcd1234abcd1234"
    instance_type = "r6i.4xlarge"
    vpc_security_group_ids = [aws_security_group.PathnexSG.id]
    tags = {
        Name = "Pathnex-EC2"
    }
}