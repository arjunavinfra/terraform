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
  count = 3
  vpc_id     = aws_vpc.kubex_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "kubex subnet public  - ${count.index}"
  }
}

resource "aws_subnet" "subnet_private" {
  count = 3
  vpc_id     = aws_vpc.kubex_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = false 
  tags = {
    Name = "kubex subnet private - ${count.index}"
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.kubex_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "kubex route table public "
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.kubex_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "kubex route table private"
  }
}



resource "aws_route" "route_public" {
  route_table_id            = aws_route_table.route_table_public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
  depends_on                = [aws_route_table.route_table_public]

}

resource "aws_route" "route_private" {
  route_table_id            = aws_route_table.route_table_private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.nat_gw.id
  depends_on                = [aws_route_table.route_table_private]
}
