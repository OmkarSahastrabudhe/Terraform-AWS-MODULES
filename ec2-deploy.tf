provider "aws" {
  region = "ap-south-1"
  
}

module "ec2_module" {
  source = "./EC2-MODULE"
  ami_id = "ami-019715e0d74f695be"
  instance_type = "t3.small"
  key_name = "superkey"
}