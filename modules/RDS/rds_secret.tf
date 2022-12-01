# variable "password" {
#   default = "bc62d2103ce0"

# }

# resource "aws_secretsmanager_secret" "db_secret" {
#   name = "db_secret"
# }
# resource "aws_secretsmanager_secret_version" "db_secret" {
#   secret_id     = aws_secretsmanager_secret.db_secret.id
#   secret_string = jsonencode(var.password)
# }