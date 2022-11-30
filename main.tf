resource "aws_vpc" "kubex_vpc" {
  cidr_block = "10.0.0.0/16"
    tags = {
    Name = "kubex vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kubex_vpc.id

  tags = {
    Name = "kubex igw"
  }
}

resource "aws_eip" "eip" {
  vpc      = true
  depends_on = [
    aws_internet_gateway.igw
  ]
    tags = {
    Name = "kubex elasticIP"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnet_public.id

  tags = {
    Name = "kubex nat gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.kubex_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "kubex subnet pub"
  }
}

resource "aws_subnet" "subnet_private" {
  vpc_id     = aws_vpc.kubex_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "kubex subnet pri"
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.kubex.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "kubex route table pub"
  }
}

