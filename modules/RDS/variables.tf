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

variable "sg" {
  
}
variable "subnet" {
  
}
