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

module "overwrite" {
  source = "../../"

  ssm_parameter_count               = 3
  prefix                            = "tftestSsmParam/${random_string.this.result}"
  names                             = ["/foo", "/bar", "/baz"]
  types                             = ["String", "SecureString", "StringList"]
  values                            = ["foo was here", "bar war here", "baz was here"]
  overwrite                         = true
  kms_key_create                    = true
  kms_key_name                      = "tftestSsmKmsKey${random_string.this.result}"
  kms_key_alias_name                = "tftestKmsKeySsm${random_string.this.result}"
  iam_policy_create                 = true
  iam_policy_name_prefix_read_only  = "tftestPolicyReadSsm${random_string.this.result}"
  iam_policy_name_prefix_read_write = "tftestPolicyWriteSsm${random_string.this.result}"

  tags {
    Name = "tftest"
  }
}
