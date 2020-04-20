####
# SSM Parameters
####

resource "aws_ssm_parameter" "overwrite" {
  count = var.enabled && var.overwrite ? var.parameters_count : 0

  name        = "/${var.prefix}${element(var.names, count.index)}"
  description = element(concat(var.descriptions, [""]), count.index)
  type        = element(var.types, count.index)
  value       = element(var.values, count.index)

  key_id          = element(var.types, count.index) == "SecureString" ? var.kms_key_create ? element(concat(aws_kms_key.this.*.arn, [""]), 0) : var.kms_key_arn != "" ? var.kms_key_arn : null : null
  overwrite       = true
  allowed_pattern = element(concat(var.allowed_patterns, [""]), count.index)

  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags,
  )
}

resource "aws_ssm_parameter" "no_overwrite" {
  count = var.enabled && false == var.overwrite ? var.parameters_count : 0

  name        = "/${var.prefix}${element(var.names, count.index)}"
  description = element(concat(var.descriptions, [""]), count.index)
  type        = element(var.types, count.index)
  value       = element(var.values, count.index)

  key_id          = element(var.types, count.index) == "SecureString" ? var.kms_key_create ? element(concat(aws_kms_key.this.*.arn, [""]), 0) : var.kms_key_arn != "" ? var.kms_key_arn : null : null
  allowed_pattern = element(concat(var.allowed_patterns, [""]), count.index)

  lifecycle {
    ignore_changes = [value]
  }

  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags,
  )
}

resource "aws_kms_key" "this" {
  count = var.enabled && var.kms_key_create && ! var.use_default_kms_key ? 1 : 0

  description = "KMS Key for ${var.prefix} SSM secure strings parameters encryption."

  tags = merge(
    {
      "Terraform" = "true"
    },
    {
      "Name" = var.kms_key_name
    },
    var.tags,
    var.kms_tags,
  )
}

resource "aws_kms_alias" "this" {
  count = var.enabled && var.kms_key_create && ! var.use_default_kms_key ? 1 : 0

  name          = "alias/${var.kms_key_alias_name}"
  target_key_id = aws_kms_key.this[0].key_id
}

####
# IAM Policy
####

data "aws_iam_policy_document" "read_only" {
  count = var.enabled && var.iam_policy_create ? 1 : 0

  source_json = local.kms_key_needed ? element(concat(data.aws_iam_policy_document.kms_key_read_only.*.json, [""]), 0) : null

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

    resources = formatlist(
      "arn:aws:ssm:*:%s:parameter/%s%s",
      data.aws_caller_identity.current.account_id,
      var.prefix,
      var.names,
    )
  }
}

data "aws_iam_policy_document" "kms_key_read_only" {
  count = var.enabled && var.iam_policy_create && var.use_default_kms_key ? 1 : 0

  statement {
    sid = "Allow${replace(replace(var.prefix, "-", ""), "/", "")}SSMParameterKMSAccess"

    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:ListKeyPolicies",
      "kms:GetKeyPolicy",
      "kms:DescribeKey",
    ]

    resources = [var.kms_key_create ? element(concat(aws_kms_key.this.*.arn, [""]), 0) : var.kms_key_arn]
  }
}

data "aws_iam_policy_document" "read_write" {
  count = var.enabled && var.iam_policy_create ? 1 : 0

  source_json = local.kms_key_needed ? element(concat(data.aws_iam_policy_document.kms_key_read_write.*.json, [""]), 0) : null

  statement {
    sid = "Allow${replace(replace(var.prefix, "-", ""), "/", "")}SSMParameterAccess"

    effect = "Allow"

    actions = [
      "ssm:DescribeAssociation",
      "ssm:GetDocument",
      "ssm:DescribeDocument",
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:PutParameter",
    ]

    resources = formatlist(
      "arn:aws:ssm:*:%s:parameter/%s%s",
      data.aws_caller_identity.current.account_id,
      var.prefix,
      var.names,
    )
  }
}

data "aws_iam_policy_document" "kms_key_read_write" {
  count = var.enabled && var.iam_policy_create && var.use_default_kms_key ? 1 : 0

  statement {
    sid = "Allow${replace(replace(var.prefix, "-", ""), "/", "")}SSMParameterKMSAccess"

    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:ListKeyPolicies",
      "kms:GetKeyPolicy",
      "kms:DescribeKey",
    ]

    resources = [var.kms_key_create ? element(concat(aws_kms_key.this.*.arn, [""]), 0) : var.kms_key_arn]
  }
}

resource "aws_iam_policy" "read_only" {
  count = var.enabled && var.iam_policy_create ? 1 : 0

  name_prefix = var.iam_policy_name_prefix_read_only
  path        = var.iam_policy_path
  policy      = element(concat(data.aws_iam_policy_document.read_only.*.json, [""]), 0)
  description = "Read only policy to get access to ${var.prefix} SSM parameters."
}

resource "aws_iam_policy" "read_write" {
  count = var.enabled && var.iam_policy_create ? 1 : 0

  name_prefix = var.iam_policy_name_prefix_read_write
  path        = var.iam_policy_path
  policy      = element(concat(data.aws_iam_policy_document.read_write.*.json, [""]), 0)
  description = "Read write policy to get access to ${var.prefix} SSM parameters."
}
