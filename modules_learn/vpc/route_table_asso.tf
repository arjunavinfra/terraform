resource "aws_route_table_association" "oute_table_association" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}