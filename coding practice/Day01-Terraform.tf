##Terraform task - Create EC2 (C5 xLarge)

provider "aws"{
    region = "us-east-1"
}
resource "aws_instance" "PathnexEC2" {
    ami = "ami-0c02fb55956c7d316"
    instance_type="c5.xlarge"
    tags = {
        Name = "PathnexEC2"
    }
}