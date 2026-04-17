## Terraform - EC2 with Tags (r5.2xlarge)
	
	provider "aws" {
		region = "us-east-1"
	}
	
	resource "aws_instance" "PathnexEC2" {
		ami           = "ami-01234abcd1234abcd"
		instance_type = "r5.2xlarge"
		
		tags = {
			Name        = "Pathnex-Server" 
			Environment = "Training"
			Owner       = "PathnexStudent"
		}
	}