variable "password_identifiers" {
  description = "Set of password identifiers"
  type        = set(string)
  default     = ["pass0", "pass1", "pass2"]
}

resource "random_password" "pass" {
  for_each = var.password_identifiers

  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}