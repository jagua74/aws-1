# Internet VPC
resource "aws_vpc" "user02-vpc" {
    cidr_block = "105.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    
    tags {
        Name = "user02-vpc"
    }
}

# Subnets
resource "aws_subnet" "user02-public-subnet1" {
    vpc_id = "${aws_vpc.user02-vpc.id}"
    cidr_block = "105.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-northeast-1c"

    tags {
        Name = "user02-public-subnet1"
    }
}

resource "aws_subnet" "user02-public-subnet2" {
    vpc_id = "${aws_vpc.user02-vpc.id}"
    cidr_block = "105.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-northeast-1d"

    tags {
        Name = "user02-public-subnet2"
    }
}

# Internet GW
resource "aws_internet_gateway" "user02-igw" {
    vpc_id = "${aws_vpc.user02-vpc.id}"

    tags {
        Name = "user02-igw"
    }
}

# route tables
resource "aws_route_table" "user02-rt" {
    vpc_id = "${aws_vpc.user02-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.user02-igw.id}"
    }

    tags {
        Name = "user02-rt"
    }
}

# route associations public
resource "aws_route_table_association" "user02-public-1a" {
    subnet_id = "${aws_subnet.user02-public-subnet1.id}"
    route_table_id = "${aws_route_table.user02-rt.id}"
}

resource "aws_route_table_association" "user02-public-2a" {
    subnet_id = "${aws_subnet.user02-public-subnet2.id}"
    route_table_id = "${aws_route_table.user02-rt.id}"
}