resource "aws_vpc" "kubex_vpc" {
  cidr_block = "10.0.0.0/16"
    tags = {
    Name = "kubex"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kubex_vpc.id

  tags = {
    Name = "kubex"
  }
}

resource "aws_eip" "eip" {
  vpc      = true
  depends_on = [
    aws_internet_gateway.igw
  ]
    tags = {
    Name = "kubex"
  }
}