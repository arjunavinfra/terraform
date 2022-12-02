# terraform

modify the ssh public key inside EC2 module.

Deploy the changes by 

terraform init ; terraform plan ;terraform apply --auto-approve

login to the EC2 host then run 

 psql -h <hostname of RDS>
 
 
username: postgres
database Password can be found under the AWS service secretsmanager
