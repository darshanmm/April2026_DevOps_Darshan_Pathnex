# VPC+Networking
resource "aws_vpc" "main"{
    cidr_block = "10.0.0.0/16"
    tags = {
        name = "main-vpc"
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.vpc_id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true
    tags = {
        name = "public_subnet"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.main.id
}

resource "aws_route" "internet_access" {
    route_table_id = aws_route_table.rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.rt.id
}

#aws_security_group
resource "aws_security_group" "ec2_sg" {
    vpc_id = aws_vpc.main.id

    ingress {
        description = "SSH access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.allowed_ssh_ip]
    }

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port =0
        to_port =0
        protocol =-1 
        cidr_blocks ["0.0.0.0/0"]
    }
}

#Key pair
resource "aws_key_pair" "key" {
    key_name = "pathnex-key"
    public_key = file("~/.ssh/id_rsa.pub")
}

#IAM Role
resource "aws_iam_role" "ec2_role" {
    name = "ec2-role"
    assume_role_policy = jsonencode ({
        version = "2012-10-17"
        Statement = [{
            Action = "sts:Assumerole",
            Effect = "Allow",
            Principal= {
                Service = "ec2.amazonaws.com"
            }
        }]
    })
}
resource "aws_iam_role_policy_attachment" "ssm" {
    role = aws_iam_role.ec2_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMmanagerInstanceCore"

}
resource "aws_iam_instance_profile" "profile" {
    role = aws_iam_role.ec2_role.name
}

#Latest AMI 
data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

#EC2 Instance 
resource "aws_instance" "ec2"{
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    key_name = aws_key_pair.key.key_name
    iam_instance_profile = aws_iam_instance_profile.profile.name
    associate_public_ip_address = true

    monitoring = true
    tags = {
        Name = "PathnexEc2"
        Environment = "Dev"
        Owner = "DevOps"
    }
}
