output "arns" {
  value = "${module.external_kms_no_policy.arns}"
}

output "names" {
  value = "${module.external_kms_no_policy.names}"
}

output "iam_policy_read_only_id" {
  value = "${module.external_kms_no_policy.iam_policy_read_only_id}"
}

output "iam_policy_read_only_arn" {
  value = "${module.external_kms_no_policy.iam_policy_read_only_arn}"
}

output "iam_policy_read_only_path" {
  value = "${module.external_kms_no_policy.iam_policy_read_only_path}"
}

output "iam_policy_read_write_id" {
  value = "${module.external_kms_no_policy.iam_policy_read_write_id}"
}

output "iam_policy_read_write_arn" {
  value = "${module.external_kms_no_policy.iam_policy_read_write_arn}"
}

output "iam_policy_read_write_path" {
  value = "${module.external_kms_no_policy.iam_policy_read_write_path}"
}
