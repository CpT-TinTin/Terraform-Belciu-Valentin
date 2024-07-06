resource "random_password" "pass" {
  count = 3
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}