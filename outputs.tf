output "arns" {
  description = "ARNs of SSM Parameters"
  value = compact(
    concat(
      aws_ssm_parameter.do_not_ignore_changes_on_value.*.arn,
      aws_ssm_parameter.ignore_changes_on_value.*.arn,
      [""],
    ),
  )
}

output "names" {
  description = "Names of SSM Parameters"
  value = compact(
    concat(
      aws_ssm_parameter.do_not_ignore_changes_on_value.*.name,
      aws_ssm_parameter.ignore_changes_on_value.*.name,
      [""],
    ),
  )
}

output "types" {
  description = "Types of SSM parameters"
  value = compact(
    concat(
      aws_ssm_parameter.do_not_ignore_changes_on_value.*.type,
      aws_ssm_parameter.ignore_changes_on_value.*.type,
      [""],
    )
  )
}

output "versions" {
  description = "Versions of SSM parameters"
  value = compact(
    concat(
      aws_ssm_parameter.do_not_ignore_changes_on_value.*.version,
      aws_ssm_parameter.ignore_changes_on_value.*.version,
      [""],
    )
  )
}

output "kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value = element(
    concat(
      aws_kms_key.this.*.arn,
      [""],
  ), 0)
}

output "kms_key_id" {
  description = "Globally unique identifier for the key"
  value = element(
    concat(
      aws_kms_key.this.*.key_id,
      [""],
  ), 0)
}

output "kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value = element(
    concat(
      aws_kms_alias.this.*.arn,
      [""],
  ), 0)
}

output "kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value = element(
    concat(
      aws_kms_alias.this.*.target_key_arn,
      [""],
  ), 0)
}

output "iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value = element(
    concat(
      aws_iam_policy.read_only.*.id,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value = element(
    concat(
      aws_iam_policy.read_only.*.arn,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value = element(
    concat(
      aws_iam_policy.read_only.*.description,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value = element(
    concat(
      aws_iam_policy.read_only.*.name,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_only_path" {
  description = "Path of the read only policy"
  value = element(
    concat(
      aws_iam_policy.read_only.*.path,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_only_policy" {
  description = "The policy document"
  value = element(
    concat(
      aws_iam_policy.read_only.*.policy,
      [""]
    ),
    0,
  )
}

output "iam_policy_read_write_id" {
  description = "ID of the read write policy"
  value = element(
    concat(
      aws_iam_policy.read_write.*.id,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_write_arn" {
  description = "ARN of the read write policy"
  value = element(
    concat(
      aws_iam_policy.read_write.*.arn,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_write_description" {
  description = "The description of the read write policy"
  value = element(
    concat(
      aws_iam_policy.read_write.*.description,
      [""]
    ),
    0
  )
}

output "iam_policy_read_write_name" {
  description = "The name of the read write policy"
  value = element(
    concat(
      aws_iam_policy.read_write.*.name,
      [""]
    ),
    0,
  )
}

output "iam_policy_read_write_path" {
  description = "Path of the read write policy"
  value = element(
    concat(
      aws_iam_policy.read_write.*.path,
      [""],
    ),
    0,
  )
}

output "iam_policy_read_write_policy" {
  description = "The policy document"
  value = element(
    concat(
      aws_iam_policy.read_write.*.policy,
      [""],
    ),
    0
  )
}
