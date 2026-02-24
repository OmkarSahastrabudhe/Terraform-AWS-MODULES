variable "env" {


}

variable "projectname" {
  
}

output "subnet_id_public" {
  value = aws_subnet.public_subnet.id
  sensitive = true
}

output "subnet_id_private" {
    sensitive = true
  value = aws_subnet.private_subnet.id
}
output "default_routetable" {
    value = aws_default_route_table.default_routetable.id
    sensitive = true
  
}
output "vpc_id" {
    value = aws_vpc.my_vpc.id
    sensitive = true
}

output "default_securitygroup" {
    value = aws_vpc.my_vpc.default_security_group_id
    sensitive = true
  
}