## 🔹 Terraform — Output Public IP (r5.2xlarge)

resource "aws_instance" "PathnexServer"{
    ami = "ami-0abcd1234abcd1234"
    instance_type = "r5.2xlarge"

    tags = {
        Name = "Pathnex-Output-EC2"
    }
}
output "PathnexPublicIP {
    value = aws_instance.PathnexServer.public_ip
}