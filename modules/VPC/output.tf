
output "subnet_public_output" {
  value = aws_subnet.subnet_public.*.id
}

output "subnet_private_output" {
  value = aws_subnet.subnet_private.*.id
}
output "vpc" {
  value = aws_vpc.kubex_vpc.id
}
output "sg" {
  value = aws_security_group.kubex-sg.id
}

