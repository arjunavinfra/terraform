output "ipaddr" {
  value = "${aws_instance.web.public_ip}"
}