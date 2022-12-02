
resource "aws_key_pair" "ec2_key" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfyynk/rcqbgf3ZeTBHUC0nqaxtRzWbSYY1ekNbnAyX8J6l+pWnz52z6DYwIyHAEj3lGQFKBR4HBfp5oFI9kCselPYM4Komvouu/6ajzDqjrOanmiA66oSIQkEn4AbCPj7feLi92BXVJVi6d6SsS11zWlF2H66jtu9Kuwk6U6ncG1Gsra/5LNNh68cvWs3PlIg8yCfI3hJ3XIAjOekuyO1QGaZU0BmhGKjjJ9A/MPS+kHk/l7mIKS4Tcx5Lbkkju+YsIQ1kIuvKwAuarNM1nx4sNtpzEOk6fHwTz02Oj0kfNYR6C9sVLDDMSr8Qqd9Lnp4/hkaq5e+UsghxsWaLDNbuLDUDrbU/l6fEy/FSZbRwLALIU6YdcbMeStZa31RmAe+ng1JxntgsRPBnyMczSGhd0JFuwiCyDt3Z3cTkdGbTDdmqOcerNIIqJLsnKjLgTp1NxMx4Z3LV3CB9N5EaAsIKmmqRd5O2QvNPG0cgL4bepdkbzm6Mmjc4hI/fF8Hx90= arjun@ARJUN-AV"
  }



data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = tostring(var.subnet_id[0])
  vpc_security_group_ids = [var.sg]
  key_name = aws_key_pair.ec2_key.id
  user_data = <<EOF
      #bin/bash 
      apt update 
      apt install  postgresql-client -y"
  EOF
  tags = {
    Name = "kubex webserver"
  }
}
