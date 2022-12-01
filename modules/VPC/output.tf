
output "subnet_public_output" {
  value = aws_subnet.subnet_public.*.id
}
