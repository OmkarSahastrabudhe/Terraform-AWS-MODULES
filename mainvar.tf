variable "project_name" {
  description = "The name of the project in which to create the resources."
  type        = string
  
}
variable "env" {
  description = "The environment in which to create the resources."
  type        = string
  
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance."
  type        = string
  
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
  
}
variable "instance_type" {
  description = "The instance type to use for the EC2 instance."
  type        = string
  
}