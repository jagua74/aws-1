resource "aws_elb" "user02-elb" {
  name = "user02-elb"
  subnets = ["${aws_subnet.user02-public-subnet1.id}", "${aws_subnet.user02-public-subnet2.id}"]
  security_groups = ["${aws_security_group.user02-elb-sg.id}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 5
    timeout = 4
    target = "HTTP:80/"
    interval = 5
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  
  tags {
    key = "Name"
    value = "user02-elb"
  }
}

