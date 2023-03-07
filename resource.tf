# vpc creation
resource "aws_vpc" "prime-vpc" {
  cidr_block           = var.prime-vpc_cidr 
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "prime"
  }
}



# private subnet1

resource "aws_subnet" "prime-priv1" {
  vpc_id            = aws_vpc.prime-vpc.id
  cidr_block        = var.prime-priv1_cidr
  availability_zone = var.prim-priv1-az

  tags = {
    Name = "private-sub1"
  }
}


# private subnet2

resource "aws_subnet" "prime-priv2" {
  vpc_id            = aws_vpc.prime-vpc.id
  cidr_block        = var.prime-priv2_cidr
  availability_zone = var.prime-priv2-az

  tags = {
    Name = "private-sub2"
  }
}



# Private route table

resource "aws_route_table" "prime-priv-rt" {
  vpc_id = aws_vpc.prime-vpc.id

  route = []

  tags = {
    Name = "private-rt"
  }
}


# Subnet-priv1 association with route table

resource "aws_route_table_association" "prime-priv1" {
  subnet_id      = aws_subnet.prime-priv1.id
  route_table_id = aws_route_table.prime-priv-rt.id
}


# Subnet-priv2 association with route table

resource "aws_route_table_association" "prime-priv2" {
  subnet_id      = aws_subnet.prime-priv2.id
  route_table_id = aws_route_table.prime-priv-rt.id
}