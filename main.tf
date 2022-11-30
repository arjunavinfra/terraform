module "vpc" {
  source = "./modules/VPC"
}

module "ec2" {
  source = "./modules/EC2"
  subnet_id = "${module.vpc.subnet_public_output}"
}