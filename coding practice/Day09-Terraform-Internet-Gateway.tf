## 🔹 Terraform — Internet Gateway

resource "aws_internet_gateway" "PathnexIGW" {
    vpc_id = aws_vpc.PathnexVPC.id

    tags = {
        Name = "Pathnex-IGW"
    }
}