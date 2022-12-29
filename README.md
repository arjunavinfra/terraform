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

```ruby

arjun@ARJUN-AV:~/Documents/terraform$ terraform init ; 
Initializing modules...
- ec2 in modules/EC2
- rds in modules/RDS
- vpc in modules/VPC

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 4.0"...
- Finding latest version of hashicorp/random...
- Installing hashicorp/aws v4.48.0...
- Installed hashicorp/aws v4.48.0 (signed by HashiCorp)
- Installing hashicorp/random v3.4.3...
- Installed hashicorp/random v3.4.3 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
module.vpc.data.aws_availability_zones.available: Reading...
module.vpc.data.aws_availability_zones.available: Read complete after 1s [id=us-east-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # module.ec2.data.aws_ami.ubuntu will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "aws_ami" "ubuntu" {
      + architecture          = (known after apply)
      + arn                   = (known after apply)
      + block_device_mappings = (known after apply)
      + boot_mode             = (known after apply)
      + creation_date         = (known after apply)
      + deprecation_time      = (known after apply)
      + description           = (known after apply)
      + ena_support           = (known after apply)
      + hypervisor            = (known after apply)
      + id                    = (known after apply)
      + image_id              = (known after apply)
      + image_location        = (known after apply)
      + image_owner_alias     = (known after apply)
      + image_type            = (known after apply)
      + imds_support          = (known after apply)
      + kernel_id             = (known after apply)
      + most_recent           = true
      + name                  = (known after apply)
      + owner_id              = (known after apply)
      + owners                = [
          + "099720109477",
        ]
      + platform              = (known after apply)
      + platform_details      = (known after apply)
      + product_codes         = (known after apply)
      + public                = (known after apply)
      + ramdisk_id            = (known after apply)
      + root_device_name      = (known after apply)
      + root_device_type      = (known after apply)
      + root_snapshot_id      = (known after apply)
      + sriov_net_support     = (known after apply)
      + state                 = (known after apply)
      + state_reason          = (known after apply)
      + tags                  = (known after apply)
      + tpm_support           = (known after apply)
      + usage_operation       = (known after apply)
      + virtualization_type   = (known after apply)

      + filter {
          + name   = "name"
          + values = [
              + "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*",
            ]
        }
      + filter {
          + name   = "virtualization-type"
          + values = [
              + "hvm",
            ]
        }

      + timeouts {
          + read = (known after apply)
        }
    }

  # module.ec2.aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                                  = (known after apply)
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "kubex webserver"
        }
      + tags_all                             = {
          + "Name" = "kubex webserver"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "b1a4f049ee142ba2cb81e394ba299ead85a877f4"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id                 = (known after apply)
              + capacity_reservation_resource_group_arn = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + maintenance_options {
          + auto_recovery = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_card_index    = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + private_dns_name_options {
          + enable_resource_name_dns_a_record    = (known after apply)
          + enable_resource_name_dns_aaaa_record = (known after apply)
          + hostname_type                        = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # module.ec2.aws_key_pair.ec2_key will be created
  + resource "aws_key_pair" "ec2_key" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "deployer-key"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfyynk/rcqbgf3ZeTBHUC0nqaxtRzWbSYY1ekNbnAyX8J6l+pWnz52z6DYwIyHAEj3lGQFKBR4HBfp5oFI9kCselPYM4Komvouu/6ajzDqjrOanmiA66oSIQkEn4AbCPj7feLi92BXVJVi6d6SsS11zWlF2H66jtu9Kuwk6U6ncG1Gsra/5LNNh68cvWs3PlIg8yCfI3hJ3XIAjOekuyO1QGaZU0BmhGKjjJ9A/MPS+kHk/l7mIKS4Tcx5Lbkkju+YsIQ1kIuvKwAuarNM1nx4sNtpzEOk6fHwTz02Oj0kfNYR6C9sVLDDMSr8Qqd9Lnp4/hkaq5e+UsghxsWaLDNbuLDUDrbU/l6fEy/FSZbRwLALIU6YdcbMeStZa31RmAe+ng1JxntgsRPBnyMczSGhd0JFuwiCyDt3Z3cTkdGbTDdmqOcerNIIqJLsnKjLgTp1NxMx4Z3LV3CB9N5EaAsIKmmqRd5O2QvNPG0cgL4bepdkbzm6Mmjc4hI/fF8Hx90= arjun@ARJUN-AV"
      + tags_all        = (known after apply)
    }

  # module.rds.aws_db_instance.my_database will be created
  + resource "aws_db_instance" "my_database" {
      + address                               = (known after apply)
      + allocated_storage                     = 10
      + apply_immediately                     = false
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_name                               = "postgres"
      + db_subnet_group_name                  = "main"
      + delete_automated_backups              = true
      + endpoint                              = (known after apply)
      + engine                                = "postgres"
      + engine_version                        = "12.9"
      + engine_version_actual                 = (known after apply)
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = "mydb"
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t2.micro"
      + iops                                  = (known after apply)
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + maintenance_window                    = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = false
      + name                                  = (known after apply)
      + nchar_character_set_name              = (known after apply)
      + network_type                          = (known after apply)
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = (known after apply)
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replica_mode                          = (known after apply)
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = true
      + snapshot_identifier                   = (known after apply)
      + status                                = (known after apply)
      + storage_throughput                    = (known after apply)
      + storage_type                          = (known after apply)
      + tags_all                              = (known after apply)
      + timezone                              = (known after apply)
      + username                              = "postgres"
      + vpc_security_group_ids                = (known after apply)
    }

  # module.rds.aws_db_subnet_group.rds will be created
  + resource "aws_db_subnet_group" "rds" {
      + arn                     = (known after apply)
      + description             = "Managed by Terraform"
      + id                      = (known after apply)
      + name                    = "main"
      + name_prefix             = (known after apply)
      + subnet_ids              = (known after apply)
      + supported_network_types = (known after apply)
      + tags                    = {
          + "Name" = "My DB subnet group"
        }
      + tags_all                = {
          + "Name" = "My DB subnet group"
        }
    }

  # module.rds.aws_secretsmanager_secret.db-pass will be created
  + resource "aws_secretsmanager_secret" "db-pass" {
      + arn                            = (known after apply)
      + force_overwrite_replica_secret = false
      + id                             = (known after apply)
      + name                           = "rds-password-secrete"
      + name_prefix                    = (known after apply)
      + policy                         = (known after apply)
      + recovery_window_in_days        = 0
      + rotation_enabled               = (known after apply)
      + rotation_lambda_arn            = (known after apply)
      + tags_all                       = (known after apply)

      + replica {
          + kms_key_id         = (known after apply)
          + last_accessed_date = (known after apply)
          + region             = (known after apply)
          + status             = (known after apply)
          + status_message     = (known after apply)
        }

      + rotation_rules {
          + automatically_after_days = (known after apply)
        }
    }

  # module.rds.aws_secretsmanager_secret_version.db-pass-val will be created
  + resource "aws_secretsmanager_secret_version" "db-pass-val" {
      + arn            = (known after apply)
      + id             = (known after apply)
      + secret_id      = (known after apply)
      + secret_string  = (sensitive value)
      + version_id     = (known after apply)
      + version_stages = (known after apply)
    }

  # module.rds.random_password.db_master_pass will be created
  + resource "random_password" "db_master_pass" {
      + bcrypt_hash      = (sensitive value)
      + id               = (known after apply)
      + length           = 20
      + lower            = true
      + min_lower        = 0
      + min_numeric      = 0
      + min_special      = 5
      + min_upper        = 0
      + number           = true
      + numeric          = true
      + override_special = "!#"
      + result           = (sensitive value)
      + special          = true
      + upper            = true
    }

  # module.vpc.aws_eip.eip will be created
  + resource "aws_eip" "eip" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Name" = "kubex elasticIP"
        }
      + tags_all             = {
          + "Name" = "kubex elasticIP"
        }
      + vpc                  = true
    }

  # module.vpc.aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "kubex igw"
        }
      + tags_all = {
          + "Name" = "kubex igw"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.nat_gw will be created
  + resource "aws_nat_gateway" "nat_gw" {
      + allocation_id        = (known after apply)
      + connectivity_type    = "public"
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Name" = "kubex nat gw"
        }
      + tags_all             = {
          + "Name" = "kubex nat gw"
        }
    }

  # module.vpc.aws_route.route_private_nat_gw will be created
  + resource "aws_route" "route_private_nat_gw" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # module.vpc.aws_route.route_public_igw will be created
  + resource "aws_route" "route_public_igw" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # module.vpc.aws_route_table.route_table_private will be created
  + resource "aws_route_table" "route_table_private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "kubex route table private"
        }
      + tags_all         = {
          + "Name" = "kubex route table private"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.route_table_public will be created
  + resource "aws_route_table" "route_table_public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "kubex route table public "
        }
      + tags_all         = {
          + "Name" = "kubex route table public "
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.route_table_association_private[0] will be created
  + resource "aws_route_table_association" "route_table_association_private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.route_table_association_private[1] will be created
  + resource "aws_route_table_association" "route_table_association_private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.route_table_association_private[2] will be created
  + resource "aws_route_table_association" "route_table_association_private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.route_table_association_public[0] will be created
  + resource "aws_route_table_association" "route_table_association_public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.route_table_association_public[1] will be created
  + resource "aws_route_table_association" "route_table_association_public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.route_table_association_public[2] will be created
  + resource "aws_route_table_association" "route_table_association_public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_security_group.kubex-sg will be created
  + resource "aws_security_group" "kubex-sg" {
      + arn                    = (known after apply)
      + description            = "Default SG to alllow traffic from the VPC"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 5432
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 5432
            },
        ]
      + name                   = "kubex-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "kubex-sg"
        }
      + tags_all               = {
          + "Environment" = "kubex-sg"
        }
      + vpc_id                 = (known after apply)
    }

  # module.vpc.aws_subnet.subnet_private[0] will be created
  + resource "aws_subnet" "subnet_private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.4.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "kubex subnet private - 0"
        }
      + tags_all                                       = {
          + "Name" = "kubex subnet private - 0"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.subnet_private[1] will be created
  + resource "aws_subnet" "subnet_private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.5.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "kubex subnet private - 1"
        }
      + tags_all                                       = {
          + "Name" = "kubex subnet private - 1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.subnet_private[2] will be created
  + resource "aws_subnet" "subnet_private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.6.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "kubex subnet private - 2"
        }
      + tags_all                                       = {
          + "Name" = "kubex subnet private - 2"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.subnet_public[0] will be created
  + resource "aws_subnet" "subnet_public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "kubex subnet public  - 0"
        }
      + tags_all                                       = {
          + "Name" = "kubex subnet public  - 0"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.subnet_public[1] will be created
  + resource "aws_subnet" "subnet_public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "kubex subnet public  - 1"
        }
      + tags_all                                       = {
          + "Name" = "kubex subnet public  - 1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.subnet_public[2] will be created
  + resource "aws_subnet" "subnet_public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "kubex subnet public  - 2"
        }
      + tags_all                                       = {
          + "Name" = "kubex subnet public  - 2"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_vpc.kubex_vpc will be created
  + resource "aws_vpc" "kubex_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_classiclink                   = (known after apply)
      + enable_classiclink_dns_support       = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "kubex vpc"
        }
      + tags_all                             = {
          + "Name" = "kubex vpc"
        }
    }

Plan: 28 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.

```
