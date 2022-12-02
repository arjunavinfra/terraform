variable "pub_subnet_cidr" {
  type= list
  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}


variable "pri_subnet_cidr" {
   type= list
  default = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "cidr_block_everywhere" {
  default = "0.0.0.0/0"
}
