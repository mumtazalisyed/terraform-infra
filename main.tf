resource "aws_vpc" "jenkins_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "jenkins-vpc"
  }
}


resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet1"
  }
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet2"
  }
}


resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "PrivateSubnet1"
  }
}


resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1b"  # Change to a valid availability zone in eu-west-2
  tags = {
    Name = "PrivateSubnet2"
  }
}


resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id
}


output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}


output "private_subnet_ids" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}


