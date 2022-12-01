resource "aws_db_instance" "my_database" {
  allocated_storage    = 10
  db_name              = "postgres"
  engine               = "postgres"
  engine_version       = "12.9"
  instance_class       = "db.t2.micro"
  username             = "postgres"
  password             = "foobarbaz"
  #Sparameter_group_name = aws_db_parameter_group.my_databse.name
                          #aws_db_subnet_group.education.name
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