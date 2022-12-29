# terraform

Pre steps:
1. Confgure aws-cli access 

2.Modify the ssh public key inside EC2 module https://github.com/arjunavinfra/terraform/blob/main/modules/EC2/variables.tf

**Deploy the changes by** 

```ruby
terraform init ; 
terraform plan ;
terraform apply --auto-approve
```

**login to the EC2 host then run** 

 ```ruby
 psql -h <hostname of RDS>
 ```
 
username: postgres
database Password can be found under the AWS service secretsmanager
 
**Destory the infra using**
 
 ```ruby
 terraform destroy 
 ```


terraform plan output 

```
