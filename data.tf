data "aws_caller_identity" "current" {
}

locals {
  kms_key_needed = contains(var.types, "SecureString")
}
