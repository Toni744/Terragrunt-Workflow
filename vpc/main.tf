provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
    vpc_id     = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet2" {
    vpc_id     = aws_vpc.my_vpc.id
    cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "subnet3" {
    vpc_id     = aws_vpc.my_vpc.id
    cidr_block = "10.0.3.0/24"
}