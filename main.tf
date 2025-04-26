provider "aws" {
    region = "eu-central-1"
}

resource "aws_vpc" "lastminutefix_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "lastminutefix-vpc"
    }
}

resource "aws_subnet" "lastminutefix_subnet" {
    count = 2
    vpc_id = aws_vpc.lastminutefix_vpc.id
    cidr_block = cidrsubnet(aws_vpc.lastminutefix_vpc.cidr_block, 8, count.index)
    availability_zone = element(["eu-central-1a", "eu-central-1b"], count.index)
    map_public_ip_on_launch = true
    tags = {
        Name = "lastminutefix-subnet-${count.index}"
    }
}
