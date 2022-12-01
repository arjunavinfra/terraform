module "vpc" {
  source = "./modules/VPC"
}

module "ec2" {
  source = "./modules/EC2"
  subnet_id = "${module.vpc.subnet_public_output}"
  sg = "${module.vpc.sg}"
  depends_on = [module.vpc]
}

module "rds" {
  source = "./modules/RDS"
  sg = "${module.vpc.sg}"
  subnet = "${module.vpc.subnet_private_output}"
  depends_on = [module.vpc]

  
}