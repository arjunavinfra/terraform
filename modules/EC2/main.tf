
resource "aws_key_pair" "ec2_key" {
  key_name   = "deployer-key"
  public_key = var.public_key
  
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
  instance_type = var.instance_type
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
