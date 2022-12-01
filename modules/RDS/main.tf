resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "postgresql"
  engine               = "postgresql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "postgres"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.sg]
  db_subnet_group_name  = aws_db_subnet_group.rds.name
}

resource "aws_db_subnet_group" "rds" {
  name       = "main"
  subnet_ids = var.subnet

  tags = {
    Name = "My DB subnet group"
  }
}