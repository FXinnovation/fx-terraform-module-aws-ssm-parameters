provider "aws" {
  version    = "~> 2.2.0"
  region     = "eu-west-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}

resource "aws_kms_key" "this" {
  tags = "${merge(
    map("Name", "tftestKmsKey${random_string.this.result}"),
  )}"
}

resource "aws_kms_alias" "this" {
  name          = "alias/tftest${random_string.this.result}"
  target_key_id = "${aws_kms_key.this.key_id}"
}

module "standard" {
  source = "../../"

  ssm_parameter_count = 3
  prefix              = "tftestSsmParam${random_string.this.result}"
  names               = ["/foo", "/bar", "/baz"]
  types               = ["String", "SecureString", "StringList"]
  values              = ["foo was here", "bar war here", "baz was here"]
  kms_key_create      = false
  kms_key_id          = "${aws_kms_alias.this.id}"
  kms_key_arn         = "${aws_kms_alias.this.arn}"
  iam_policy_create   = false

  tags {
    Name = "tftest"
  }
}
