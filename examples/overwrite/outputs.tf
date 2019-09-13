output "arns" {
  description = "ARNs of SSM Parameters"
  value       = "${module.overwrite.arns}"
}

output "names" {
  description = "Names of SSM Parameters"
  value       = "${module.overwrite.names}"
}

output "types" {
  description = "Types of SSM parameters"
  value       = "${module.overwrite.types}"
}

output "versions" {
  description = "Versions of SSM parameters"
  value       = "${module.overwrite.versions}"
}

output "kms_key_arns" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = "${module.overwrite.kms_key_arns}"
}

output "kms_key_ids" {
  description = "Globally unique identifier for the key"
  value       = "${module.overwrite.kms_key_ids}"
}

output "kms_alias_arns" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = "${module.overwrite.kms_alias_arns}"
}

output "kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = "${module.overwrite.kms_alias_target_key_arn}"
}

output "iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = "${module.overwrite.iam_policy_read_only_id}"
}

output "iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = "${module.overwrite.iam_policy_read_only_arn}"
}

output "iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = "${module.overwrite.iam_policy_read_only_description}"
}

output "iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = "${module.overwrite.iam_policy_read_only_name}"
}

output "iam_policy_read_only_path" {
  description = "Path of the read only policy"
  value       = "${module.overwrite.iam_policy_read_only_path}"
}

output "iam_policy_read_only_policy" {
  description = "The policy document"
  value       = "${module.overwrite.iam_policy_read_only_policy}"
}

output "iam_policy_read_write_id" {
  description = "ID of the read write policy"
  value       = "${module.overwrite.iam_policy_read_write_id}"
}

output "iam_policy_read_write_arn" {
  description = "ARN of the read write policy"
  value       = "${module.overwrite.iam_policy_read_write_arn}"
}

output "iam_policy_read_write_description" {
  description = "The description of the read write policy"
  value       = "${module.overwrite.iam_policy_read_write_description}"
}

output "iam_policy_read_write_name" {
  description = "The name of the read write policy"
  value       = "${module.overwrite.iam_policy_read_write_name}"
}

output "iam_policy_read_write_path" {
  description = "Path of the read write policy"
  value       = "${module.overwrite.iam_policy_read_write_path}"
}

output "iam_policy_read_write_policy" {
  description = "The policy document"
  value       = "${module.overwrite.iam_policy_read_write_policy}"
}
