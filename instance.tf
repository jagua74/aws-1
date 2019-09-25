resource "aws_instance" "user02-public-vm1" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"
    
    subnet_id = "${aws_subnet.user02-public-subnet1.id}"
    vpc_security_group_ids = [
       "${aws_security_group.user02-sg.id}"
    ]
    key_name = "${var.PATH_TO_PRIVATE_KEY}"
    count = 1
    
    tags {
        Name = "user02-public-vm1"
    }
    associate_public_ip_address = true
}

# resource "aws_instance" "user02-public-vm2" {
#    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
#    instance_type = "t2.micro"
#
#    subnet_id = "${aws_subnet.user02-public-subnet2.id}"
#    vpc_security_group_ids = [
#       "${aws_security_group.user02-sg.id}"
#    ]
#    key_name = "${var.PATH_TO_PRIVATE_KEY}"
#    count = 1
#    
#    tags {
#        Name = "user02-public-vm2"
#    }
#    associate_public_ip_address = true
#}