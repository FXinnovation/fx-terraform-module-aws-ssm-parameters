output "aws_ssm_parameter_arns" {
  description = "ARNs of SSM Parameters"
  value       = "${compact(concat(aws_ssm_parameter.overwrite.*.arn, aws_ssm_parameter.no_overwrite.*.arn, list("")))}"
}

output "aws_ssm_parameter_names" {
  description = "Names of SSM Parameters"
  value       = "${compact(concat(aws_ssm_parameter.overwrite.*.name, aws_ssm_parameter.no_overwrite.*.name, list("")))}"
}

output "aws_ssm_parameter_types" {
  description = "Types of SSM parameters"
  value       = "${compact(concat(aws_ssm_parameter.overwrite.*.description, aws_ssm_parameter.no_overwrite.*.description, list("")))}"
}

output "aws_ssm_parameter_versions" {
  description = "Versions of SSM parameters"
  value       = "${compact(concat(aws_ssm_parameter.overwrite.*.version, aws_ssm_parameter.no_overwrite.*.version, list("")))}"
}

output "aws_kms_key_arns" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = "${compact(concat(aws_kms_key.this.*.arn, list("")))}"
}

output "aws_kms_key_key_ids" {
  description = "Globally unique identifier for the key"
  value       = "${compact(concat(aws_kms_key.this.*.key_id, list("")))}"
}

output "aws_kms_alias_arns" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = "${compact(concat(aws_kms_alias.this.*.arn, list("")))}"
}

output "aws_kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = "${compact(concat(aws_kms_alias.this.*.target_key_arn, list("")))}"
}

output "iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = "${element(concat(aws_iam_policy.read_kms.*.id, aws_iam_policy.read_no_kms.*.id, list("")), 0)}"
}

output "iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = "${element(concat(aws_iam_policy.read_kms.*.arn, aws_iam_policy.read_no_kms.*.arn, list("")), 0)}"
}

output "iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = "${element(concat(aws_iam_policy.read_kms.*.description, aws_iam_policy.read_no_kms.*.description, list("")), 0)}"
}

output "iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = "${element(concat(aws_iam_policy.read_kms.*.name, aws_iam_policy.read_no_kms.*.name, list("")), 0)}"
}

output "iam_policy_read_only_path" {
  description = "Path of the read only policy"
  value       = "${element(concat(aws_iam_policy.read_kms.*.path, aws_iam_policy.read_no_kms.*.path, list("")), 0)}"
}

output "iam_policy_read_only_policy" {
  description = "The policy document"
  value       = "${element(concat(aws_iam_policy.read_kms.*.policy, aws_iam_policy.read_no_kms.*.policy, list("")), 0)}"
}

output "iam_policy_read_write_id" {
  description = "ID of the read write policy"
  value       = "${element(concat(aws_iam_policy.read_write_kms.*.id, aws_iam_policy.read_write_no_kms.*.id, list("")), 0)}"
}

output "iam_policy_read_write_arn" {
  description = "ARN of the read write policy"
  value       = "${element(concat(aws_iam_policy.read_write_kms.*.arn, aws_iam_policy.read_write_no_kms.*.arn, list("")), 0)}"
}

output "iam_policy_read_write_description" {
  description = "The description of the read write policy"
  value       = "${element(concat(aws_iam_policy.read_write_kms.*.description, aws_iam_policy.read_write_no_kms.*.description, list("")), 0)}"
}

output "iam_policy_read_write_name" {
  description = "The name of the read write policy"
  value       = "${element(concat(aws_iam_policy.read_write_kms.*.name, aws_iam_policy.read_write_no_kms.*.name, list("")), 0)}"
}

output "iam_policy_read_write_path" {
  description = "Path of the read write policy"
  value       = "${element(concat(aws_iam_policy.read_write_kms.*.path, aws_iam_policy.read_write_no_kms.*.path, list("")), 0)}"
}

output "iam_policy_read_write_policy" {
  description = "The policy document"
  value       = "${element(concat(aws_iam_policy.read_write_kms.*.policy, aws_iam_policy.read_write_no_kms.*.policy, list("")), 0)}"
}
