data "aws_caller_identity" "current" {
}

locals {
  kms_key_needed = (var.kms_key_create || contains(var.types, "SecureString")) && !var.use_default_kms_key
}
