resource "aws_vpc" "my_vpc" {
  cidr_block = "198.16.0.0/16"
  tags = {
    Name = "${var.projectname}-vpc"
    env = var.env

  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "198.16.0.0/17"
  tags = {
    Name = "${var.projectname}-public-subnet"
    env = var.env
  }
  map_public_ip_on_launch = true
  
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "198.16.128.0/17"
    tags = {
      Name = "${var.projectname}-private-subnet"
      env = var.env
    }
  }

resource "aws_default_route_table" "default_routetable" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "${var.projectname}-default-routetable"
        env = var.env
    }
    default_route_table_id = aws_vpc.my_vpc.default_route_table_id
   
}
resource "aws_route" "default_internet_access" {
  route_table_id         = aws_default_route_table.default_routetable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}


resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.projectname}-igw"
    env = var.env
  }
}


resource "aws_internet_gateway_attachment" "gateway_attachment" {
    vpc_id = aws_vpc.my_vpc.id
    internet_gateway_id = aws_internet_gateway.my_igw.id
     
  
  
}


resource "aws_security_group" "default_sg" {
    vpc_id = aws_vpc.my_vpc.id
    name = "${var.projectname}-default-sg"
    ingress = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]

        
        }
        ,{
            from_port = 80
            to_port = 80
            protocol = "tcp"     
          cidr_blocks = ["0.0.0.0/0"]
        }
        
    ]
    egress = [
        {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}


  




