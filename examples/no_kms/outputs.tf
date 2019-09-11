output "arns" {
  value = module.no_kms.arns
}

output "names" {
  value = module.no_kms.names
}

output "iam_policy_read_only_id" {
  value = module.no_kms.iam_policy_read_only_id
}

output "iam_policy_read_only_arn" {
  value = module.no_kms.iam_policy_read_only_arn
}

output "iam_policy_read_only_path" {
  value = module.no_kms.iam_policy_read_only_path
}

output "iam_policy_read_write_id" {
  value = module.no_kms.iam_policy_read_write_id
}

output "iam_policy_read_write_arn" {
  value = module.no_kms.iam_policy_read_write_arn
}

output "iam_policy_read_write_path" {
  value = module.no_kms.iam_policy_read_write_path
}
