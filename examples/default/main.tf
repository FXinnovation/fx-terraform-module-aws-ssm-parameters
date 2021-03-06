resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}

module "standard" {
  source = "../../"

  prefix                            = "tftestSsmParam/${random_string.this.result}"
  parameters_count                  = 3
  names                             = ["/foo", "/bar", "/baz"]
  types                             = ["String", "SecureString", "StringList"]
  values                            = ["foo was here", "bar war here", "baz was here"]
  descriptions                      = ["Know if foo was there", "Know if bar was there", "Know if baz was there"]
  allowed_patterns                  = ["", "", "[A-Za-z ]+"]
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
