resource "aws_vpc" "main" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_main_route_table_association" "main-rt-a" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.route-igw.id
}

resource "aws_route_table" "route-igw" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }
}

resource "aws_subnet" "subnet-az1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.31.16.0/20"
  availability_zone = "eu-central-1a"
}

resource "aws_subnet" "subnet-az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.31.32.0/20"
  availability_zone = "eu-central-1b"
}

resource "aws_subnet" "subnet-az3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.31.0.0/20"
  availability_zone = "eu-central-1c"
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.subnet-az1.id, aws_subnet.subnet-az2.id, aws_subnet.subnet-az3.id]
}