##Terraform - EC2 with User Data (c6a.12xlarge)
resource "aws_instance" "PathnexEC2"{
    ami = "ami-ami_0abcd1234abcd1234"
    instance_type = "c6a.12xlarge"

    user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd
    EOF

    tags = {
        Name = "Pathnex-EC2"
    }
    
}