variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "env" {
  type = string
}

variable "projectname" {
  type = string
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc_default" {
  source      = "./VPC-MODULE"
  env         = var.env
  projectname = var.projectname
}

module "ec2" {
  source            = "./EC2-MODULE"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id_public  = module.vpc_default.subnet_id_public
  security_group_id = module.vpc_default.default_securitygroup
  projectname       = var.projectname
  env               = var.env
}
