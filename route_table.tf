resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.subnet_cidr
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"
  }
}
