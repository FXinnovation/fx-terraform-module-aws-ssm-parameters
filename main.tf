####
# SSM Parameters
####

resource "aws_ssm_parameter" "overwrite" {
  count = "${var.enabled && var.overwrite ? var.ssm_parameter_count : 0}"

  name        = "/${var.prefix}${element(var.names, count.index)}"
  description = "${element(concat(var.descriptions, list("")), count.index)}"
  type        = "${element(var.types, count.index)}"
  value       = "${element(var.values, count.index)}"

  key_id          = "${element(var.types, count.index) == "SecureString" ? ( var.kms_key_create ? element(concat(aws_kms_key.this.*.id, list("")), 0) : var.kms_key_id) : "" }"
  overwrite       = true
  allowed_pattern = "${element(concat(var.allowed_patterns, list("")), count.index)}"

  tags = "${merge(
    map("Terraform", "true"),
    var.tags
  )}"
}

resource "aws_ssm_parameter" "no_overwrite" {
  count = "${var.enabled && !var.overwrite ? var.ssm_parameter_count : 0}"

  name        = "/${var.prefix}${element(var.names, count.index)}"
  description = "${element(concat(var.descriptions, list("")), count.index)}"
  type        = "${element(var.types, count.index)}"
  value       = "${element(var.values, count.index)}"

  key_id          = "${element(var.types, count.index) == "SecureString" ? ( var.kms_key_create ? element(concat(aws_kms_key.this.*.id, list("")), 0) : var.kms_key_id) : "" }"
  allowed_pattern = "${element(concat(var.allowed_patterns, list("")), count.index)}"

  lifecycle {
    ignore_changes = [
      "value",
    ]
  }

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

  name          = "alias/${var.kms_key_alias_name}"
  target_key_id = "${aws_kms_key.this.key_id}"
}

####
# IAM Policy
####

data "aws_iam_policy_document" "read" {
  statement {
    sid = "Allow${replace(replace(var.prefix, "-", ""), "/", "")}SSMParameterAccess"

    effect = "Allow"

    actions = [
      "ssm:DescribeAssociation",
      "ssm:GetDocument",
      "ssm:DescribeDocument",
      "ssm:GetParameter",
      "ssm:GetParameters",
    ]

    resources = ["${formatlist("arn:aws:ssm:*:%s:parameter/%s%s", data.aws_caller_identity.current.account_id, var.prefix, var.names)}"]
  }

  statement {
    sid = "Allow${replace(var.prefix, "/", "")}SSMParameterKMSAccess"

    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:ListKeyPolicies",
      "kms:GetKeyPolicy",
      "kms:DescribeKey",
    ]

    resources = ["${var.kms_key_create ? element(concat(aws_kms_key.this.*.arn, list("")), 0) : var.kms_key_arn}"]
  }
}

data "aws_iam_policy_document" "read_no_kms" {
  statement {
    sid = "Allow${replace(var.prefix, "/", "")}SSMParameterAccess"

    effect = "Allow"

    actions = [
      "ssm:DescribeAssociation",
      "ssm:GetDocument",
      "ssm:DescribeDocument",
      "ssm:GetParameter",
      "ssm:GetParameters",
    ]

    resources = ["${formatlist("arn:aws:ssm:*:%s:parameter/%s%s", data.aws_caller_identity.current.account_id, var.prefix, var.names)}"]
  }
}

data "aws_iam_policy_document" "read_write" {
  statement {
    sid = "Allow${replace(var.prefix, "/", "")}SSMParameterAccess"

    effect = "Allow"

    actions = [
      "ssm:DescribeAssociation",
      "ssm:GetDocument",
      "ssm:DescribeDocument",
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:PutParameter",
    ]

    resources = ["${formatlist("arn:aws:ssm:*:%s:parameter/%s%s", data.aws_caller_identity.current.account_id, var.prefix, var.names)}"]
  }

  statement {
    sid = "Allow${replace(var.prefix, "/", "")}SSMParameterKMSAccess"

    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:ListKeyPolicies",
      "kms:GetKeyPolicy",
      "kms:DescribeKey",
    ]

    resources = ["${var.kms_key_create ? element(concat(aws_kms_key.this.*.arn, list("")), 0) : var.kms_key_arn}"]
  }
}

data "aws_iam_policy_document" "read_write_no_kms" {
  statement {
    sid = "Allow${replace(var.prefix, "/", "")}SSMParameterAccess"

    effect = "Allow"

    actions = [
      "ssm:DescribeAssociation",
      "ssm:GetDocument",
      "ssm:DescribeDocument",
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:PutParameter",
    ]

    resources = ["${formatlist("arn:aws:ssm:*:%s:parameter/%s%s", data.aws_caller_identity.current.account_id, var.prefix, var.names)}"]
  }
}

resource "aws_iam_policy" "read_kms" {
  count = "${var.enabled && var.iam_policy_create && (var.kms_key_create || local.kms_key_needed) ? 1 : 0}"

  name_prefix = "${var.iam_policy_name_prefix_read_only}"
  path        = "${var.iam_policy_path}"
  policy      = "${data.aws_iam_policy_document.read.json}"
  description = "Read only policy to get access to ${var.prefix} SSM parameters."
}

resource "aws_iam_policy" "read_write_kms" {
  count = "${var.enabled && var.iam_policy_create && (var.kms_key_create || local.kms_key_needed) ? 1 : 0}"

  name_prefix = "${var.iam_policy_name_prefix_read_write}"
  path        = "${var.iam_policy_path}"
  policy      = "${data.aws_iam_policy_document.read_write.json}"
  description = "Read write policy to get access to ${var.prefix} SSM parameters."
}

resource "aws_iam_policy" "read_no_kms" {
  count = "${var.enabled && var.iam_policy_create && !var.kms_key_create && !local.kms_key_needed ? 1 : 0}"

  name_prefix = "${var.iam_policy_name_prefix_read_only}"
  path        = "${var.iam_policy_path}"
  policy      = "${data.aws_iam_policy_document.read_no_kms.json}"
  description = "Read only policy to get access to ${var.prefix} SSM parameters."
}

resource "aws_iam_policy" "read_write_no_kms" {
  count = "${var.enabled && var.iam_policy_create && !var.kms_key_create && !local.kms_key_needed ? 1 : 0}"

  name_prefix = "${var.iam_policy_name_prefix_read_write}"
  path        = "${var.iam_policy_path}"
  policy      = "${data.aws_iam_policy_document.read_write_no_kms.json}"
  description = "Read write policy to get access to ${var.prefix} SSM parameters."
}
