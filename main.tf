####
# SSM Parameters
####

resource "aws_ssm_parameter" "this" {
  count = "${var.enabled ? var.ssm_parameter_count : 0}"

  name        = "/${var.prefix}${element(var.names, count.index)}"
  description = "${element(var.descriptions, count.index)}"
  type        = "${element(var.types, count.index)}"
  value       = "${element(var.values, count.index)}"
  tier        = "${element(var.tiers, count.index)}"

  key_id          = "${var.kms_key_create ? aws_kms_key.this.arn : var.kms_key_arn}"
  overwrite       = "${var.overwrite}"
  allowed_pattern = "${element(var.allowed_patterns, count.index)}"

  tags = "${merge(
    map("Terraform", "true"),
    var.tags
  )}"
}

resource "aws_kms_key" "this" {
  count = "${var.enabled && var.kms_key_create ? 1 : 0}"

  description = "KMS Key for ${var.prefix} SSM secure strings parameters encryption."

  tags = "${merge(
    map("Terraform", "true"),
    map("Name", var.kms_key_name),
    var.tags,
    var.kms_tags
  )}"
}

resource "aws_kms_alias" "this" {
  count = "${var.enabled && var.kms_key_create ? 1 : 0}"

  name          = "${var.kms_key_alias_name}"
  target_key_id = "${aws_kms_key.this.key_id}"
}

####
# IAM Instance Profile
####

data "aws_iam_policy_document" "read" {
  statement {
    sid = "Allow${var.prefix}SSMParameterAccess"

    effect = "Allow"

    actions = [
      "ssm:DescribeAssociation",
      "ssm:GetDocument",
      "ssm:DescribeDocument",
      "ssm:GetParameter",
      "ssm:GetParameters",
    ]

    resources = [
      "arn:aws:ssm:*:${data.aws_caller_identity.current.account_id}:parameter/${var.ssm_parameter_prefix}/var.names.*",
    ]
  }

  statement {
    sid = "Allow${var.prefix}SSMParameterKMSAccess"

    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:ListKeyPolicies",
      "kms:GetKeyPolicy",
      "kms:DescribeKey",
    ]

    resources = "${var.kms_key_create ? aws_kms_key.this.arn : var.kms_key_arn}"
  }
}

resource "aws_iam_policy" "read" {
  count  = "${var.enabled && var.policy_create ? 1 : 0}"
  name   = "${var.policy_name}"
  path   = "${var.policy_path}"
  policy = "${data.aws_iam_policy_document.read.json}"
}
