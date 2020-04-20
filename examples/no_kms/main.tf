provider "aws" {
  version    = "~> 2"
  region     = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}

module "no_kms" {
  source = "../../"

  prefix                            = "tftestSsmParam/${random_string.this.result}"
  parameters_count                  = 2
  names                             = ["/foo", "/bar"]
  types                             = ["String", "SecureString"]
  values                            = ["foo was here", "bar was here"]
  descriptions                      = ["Know if foo was there", "Know if bar was there"]
  kms_key_create                    = false
  use_default_kms_key               = true
  iam_policy_create                 = true
  iam_policy_name_prefix_read_only  = "tftestPolicyReadSsm${random_string.this.result}"
  iam_policy_name_prefix_read_write = "tftestPolicyWriteSsm${random_string.this.result}"

  tags = {
    Name = "tftest"
  }
}
