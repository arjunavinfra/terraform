resource "aws_db_instance" "my_database" {
  identifier           = var.identifier
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = random_password.db_master_pass.result
  multi_az              = false
  #Sparameter_group_name = aws_db_parameter_group.my_databse.name
                          #aws_db_subnet_group.education.name
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.sg]
  db_subnet_group_name  = aws_db_subnet_group.rds.name
  # lifecycle {
  #   prevent_destroy = true
  # }
}

variable "identifier" {
  default = "mydb"
}
variable "allocated_storage" {
  default = 10
}
variable "db_name" {
  default = "postgres"
}
variable "engine" {
  default = "postgres"
}
variable "engine_version" {
  default= "12.9"
}
variable "instance_class" {
  default = "db.t2.micro"
}

variable "username" {
  default = "postgres"
}

resource "aws_db_subnet_group" "rds" {
  name       = "main"
  subnet_ids = var.subnet

  tags = {
    Name = "My DB subnet group"
  }

  #   lifecycle {
  #   prevent_destroy = true
  # }

}
