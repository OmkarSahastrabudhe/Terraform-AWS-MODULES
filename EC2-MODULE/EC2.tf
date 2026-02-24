resource "aws_instance" "ec2"{

    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.security_group_id]
    subnet_id = var.subnet_id_public
    tags = {
        Name = "${var.projectname}-ec2-instance"
        env = var.env
    }
      
}




