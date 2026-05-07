##Terraform (broken)

resource "aws_instance" "BrokenEC2" {
  ami = "ami-0xyz"
  instance_type = t2.micro
tags {
 Name = "Broken"
}
}


##Fix terraform file

resource "aws_instance" "FixedEC2-Code" {
    ami = "ami-0xyz"
    instance_type = "t2.micro"

    tags = {
        Name = "fixed"
    }
}