resource "aws_security_group" "user02-sg" {
  vpc_id = "${aws_vpc.user02-vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = ["${aws_security_group.user02-elb-sg.id}"]
  }

  tags {
    Name = "user02-sg"
  }
}

resource "aws_security_group" "user02-elb-sg" {
  vpc_id = "${aws_vpc.user02-vpc.id}"
  name = "user02-elb-sg"
  description = "security group for load balancer"
  
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
  
  tags {
    Name = "user02-elb-sg"
  }
}
