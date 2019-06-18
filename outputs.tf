output "arns" {
  description = "ARNs of SSM Parameters"
  value       = "${compact(concat(aws_ssm_parameter.this.*.arn, list("")))}"
}

output "names" {
  description = "Names of SSM Parameters"
  value       = "${compact(concat(aws_ssm_parameter.this.*.name, list("")))}"
}

output "iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = "${element(concat(aws_iam_policy.read.*.id, list("")), 0)}"
}

output "iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = "${element(concat(aws_iam_policy.read.*.arn, list("")), 0)}"
}

output "iam_policy_read_only_path" {
  description = "Path of the read only policy"
  value       = "${element(concat(aws_iam_policy.read.*.path, list("")), 0)}"
}

output "iam_policy_read_write_id" {
  description = "ID of the read write policy"
  value       = "${element(concat(aws_iam_policy.read_write.*.id, list("")), 0)}"
}

output "iam_policy_read_write_arn" {
  description = "ARN of the read write policy"
  value       = "${element(concat(aws_iam_policy.read_write.*.arn, list("")), 0)}"
}

output "iam_policy_read_write_path" {
  description = "Path of the read write policy"
  value       = "${element(concat(aws_iam_policy.read_write.*.path, list("")), 0)}"
}
