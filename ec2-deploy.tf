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
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id_public = module.vpc_default.subnet_id_public
  security_group_id = module.vpc_default.default_securitygroup
  projectname = var.projectname
  env = var.env

  
}

variable "instance_type" {

  

  
}
variable "ami_id" {

  
}

variable "projectname" {
  
}
variable "env" {
  
  
}
variable "key_name" {
  
}