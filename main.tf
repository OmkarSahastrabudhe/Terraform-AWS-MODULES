provider "aws" {
  region = "ap-south-1"
}


module "vpc_module_eks" {
  source = "./VPC-MODULE"
  env = var.vpc_env
    projectname = var.vpc_projectname
    vpc_cidr_block = var.vpc_cidr_block
    public_sub_cidr = var.vpc_public_sub_cidrs
    private_sub_cidr = var.vpc_private_sub_cidrs


  
}