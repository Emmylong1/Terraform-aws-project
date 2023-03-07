# create vpc
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc_cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "${var.project_name}-vpc"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "${var.project_name  }-igw"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create public subnet emy1
resource "aws_subnet" "public_subnet_emy1" {
  vpc_id                  =  aws_vpc.vpc.id
  cidr_block              = var.public_subnet_emy1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true
  tags      = {
    Name    = "public subnet emy1"
  }
}

# create public subnet emy2
resource "aws_subnet" "public_subnet_emy2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_emy2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet emy2"
  }
}

# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "public rout table"
  }
}

# associate public subnet emy1 to "public route table"
resource "aws_route_table_association" "public_subnet__emy1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_emy1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet emy2 to "public route table"
resource "aws_route_table_association" "public_subnet_emy2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_emy2.id
  route_table_id      = aws_route_table.public_route_table.id
}

# create private app subnet emy1
resource "aws_subnet" "private_app_subnet_emy1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_app_subnet_emy1_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private app subnet emy1"
  }
  }

# create private app subnet emy2
resource "aws_subnet" "private_app_subnet_emy2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_app_subnet_emy2_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private app subnet emy2"
  }
}
