resource "random_password" "db_master_pass" {
  length           = 20
  special          = true
  min_special      = 5
  override_special = "!#"
}

# the secret
resource "aws_secretsmanager_secret" "db-pass" {
  name = "rds-password-secrete"
  recovery_window_in_days = 0 
}

# initial version
resource "aws_secretsmanager_secret_version" "db-pass-val" {
  secret_id = aws_secretsmanager_secret.db-pass.id
	# encode in the required format
  secret_string = jsonencode(random_password.db_master_pass.result)

}

