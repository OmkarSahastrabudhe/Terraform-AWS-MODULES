provider "aws" {
  region = "ap-south-1"
  
}

module "vpc_default" {
  source = "./VPC-MODULE"
  env = "dev"
  projectname = "myproject"
   
  
  
}

module "ec2" {
  source = "./EC2-MODULE"
  ami_id = "ami-0c2b8ca1dad447f8a"
  instance_type = "t3.small"
  key_name = "superkey"
  subnet_id_public = module.vpc_default.subnet_id_public
  security_group_id = module.vpc_default.default_securitygroup
  projectname = "cbz"
  env = "dev"

  
}