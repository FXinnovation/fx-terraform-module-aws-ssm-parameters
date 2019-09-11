output "arns" {
  description = "ARNs of SSM Parameters"
  value = compact(
    concat(
      aws_ssm_parameter.overwrite.*.arn,
      aws_ssm_parameter.no_overwrite.*.arn,
      [""],
    ),
  )
}

output "names" {
  description = "Names of SSM Parameters"
  value = compact(
    concat(
      aws_ssm_parameter.overwrite.*.name,
      aws_ssm_parameter.no_overwrite.*.name,
      [""],
    ),
  )
}

output "iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value = element(
    concat(
      aws_iam_policy.read_kms.*.id,
      aws_iam_policy.read_no_kms.*.id,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value = element(
    concat(
      aws_iam_policy.read_kms.*.arn,
      aws_iam_policy.read_no_kms.*.arn,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_only_path" {
  description = "Path of the read only policy"
  value = element(
    concat(
      aws_iam_policy.read_kms.*.path,
      aws_iam_policy.read_no_kms.*.path,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_write_id" {
  description = "ID of the read write policy"
  value = element(
    concat(
      aws_iam_policy.read_write_kms.*.id,
      aws_iam_policy.read_write_no_kms.*.id,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_write_arn" {
  description = "ARN of the read write policy"
  value = element(
    concat(
      aws_iam_policy.read_write_kms.*.arn,
      aws_iam_policy.read_write_no_kms.*.arn,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_write_path" {
  description = "Path of the read write policy"
  value = element(
    concat(
      aws_iam_policy.read_write_kms.*.path,
      aws_iam_policy.read_write_no_kms.*.path,
      [""],
    ),
    0,
  )
}
