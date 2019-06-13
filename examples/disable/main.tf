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

module "standard" {
  source = "../../"

  enabled             = false
  ssm_parameter_count = 0
  prefix              = ""
  names               = []
  types               = []
  values              = []
}
