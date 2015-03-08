/* Default security group */
resource "aws_security_group" "default-group" {
  name = "default-group"
  description = "Default security group that allows inbound and outbound traffic from all instances in the VPC"
  vpc_id = "${aws_vpc.default.id}"
  
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8","82.47.226.33/32"]
    self        = true
  }
  
  tags { 
    Name = "default-group" 
  }
}

/* Nat security group */
resource "aws_security_group" "nat" {
  name = "nat"
  description = "nat security group that allows inbound and outbound traffic from all instances in the VPC"
  vpc_id = "${aws_vpc.default.id}"
  
  ingress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
    self        = true
  }
  
  tags { 
    Name = "nat" 
  }
}

/* Security group for the web */
resource "aws_security_group" "web" {
  name = "web"
  description = "Security group that allows web traffic from internet"
  vpc_id = "${aws_vpc.default.id}"
  
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags { 
    Name = "web" 
  }
}