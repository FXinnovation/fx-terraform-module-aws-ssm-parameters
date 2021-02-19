resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}

module "overwrite" {
  source = "../../"

  prefix                            = "tftestSsmParam/${random_string.this.result}"
  parameters_count                  = 3
  names                             = ["/foo", "/bar", "/baz"]
  types                             = ["String", "SecureString", "StringList"]
  values                            = ["foo was here", "bar war here", "baz was here"]
  overwrites                        = [true, false, true]
  ignore_changes_on_value           = true
  kms_key_create                    = true
  kms_key_name                      = "tftestSsmKmsKey${random_string.this.result}"
  kms_key_alias_name                = "tftestKmsKeySsm${random_string.this.result}"
  iam_policy_create                 = true
  iam_policy_name_prefix_read_only  = "tftestPolicyReadSsm${random_string.this.result}"
  iam_policy_name_prefix_read_write = "tftestPolicyWriteSsm${random_string.this.result}"

  tags = {
    Name = "tftest"
  }
}
