#############################################################
### VPC
#############################################################

resource "aws_vpc" "test-vpc" {
  cidr_block                       = var.VPC_CIDR_BLOCK
  enable_dns_support               = "true"
  enable_dns_hostnames             = "true"
  instance_tenancy                 = "default"
  assign_generated_ipv6_cidr_block = "false"

  tags = {
    Name = "test-vpc"
  }
}

#############################################################
### Subnet
#############################################################

resource "aws_subnet" "test-subnet-2a" {
  vpc_id                          = aws_vpc.test-vpc.id
  cidr_block                      = var.SUBNET_A_CIDR
  assign_ipv6_address_on_creation = "false"
  map_public_ip_on_launch         = "false"
  availability_zone               = "${var.REGION}a"

  tags = {
    Name = "test-subnet-2a"
  }
}

resource "aws_subnet" "test-subnet-2b" {
  vpc_id                          = aws_vpc.test-vpc.id
  cidr_block                      = var.SUBNET_B_CIDR
  assign_ipv6_address_on_creation = "false"
  map_public_ip_on_launch         = "false"
  availability_zone               = "${var.REGION}b"

  tags = {
    Name = "test-subnet-2b"
  }
}

resource "aws_subnet" "test-subnet-2c" {
  vpc_id                          = aws_vpc.test-vpc.id
  cidr_block                      = var.SUBNET_C_CIDR
  assign_ipv6_address_on_creation = "false"
  map_public_ip_on_launch         = "false"
  availability_zone               = "${var.REGION}c"

  tags = {
    Name = "test-subnet-2c"
  }
}

#############################################################
### Internet Gateway
#############################################################

resource "aws_internet_gateway" "test-internet-gateway" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "test-internet-gateway"
  }
}

#############################################################
### Route Table
#############################################################

resource "aws_route_table" "test-route-table" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-internet-gateway.id
  }

  tags = {
    Name = "test-route-table"
  }
}

resource "aws_main_route_table_association" "test-route-table-vpc" {
  vpc_id         = aws_vpc.test-vpc.id
  route_table_id = aws_route_table.test-route-table.id
}

resource "aws_route_table_association" "test-route-table-subnet-1a" {
  subnet_id      = aws_subnet.test-subnet-2a.id
  route_table_id = aws_route_table.test-route-table.id
}

resource "aws_route_table_association" "test-route-table-subnet-1b" {
  subnet_id      = aws_subnet.test-subnet-2b.id
  route_table_id = aws_route_table.test-route-table.id
}

resource "aws_route_table_association" "test-route-table-subnet-1c" {
  subnet_id      = aws_subnet.test-subnet-2c.id
  route_table_id = aws_route_table.test-route-table.id
}
