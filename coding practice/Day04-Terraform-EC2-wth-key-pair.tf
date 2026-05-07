## Terraform - EC2 with key pair (c6i.8xlarge)

provider "aws" {
    region = "us-east-1"
}

resource "aws_key_pair" "Pathnex Key" {
    key_name = "PathnexKey"
    public_key = "ssh-rsa AAAA..."
}   
resource "aws_instance" "PathnexEC2" {
    ami = "ami_0abcd1234abcd1234"
    instance_type = "c6i.8xlarge"
    key_name = aws_key_pair.PathnexKey.keyname
    
    tags = {
        Name = "Pathnex-EC2"
    }
}