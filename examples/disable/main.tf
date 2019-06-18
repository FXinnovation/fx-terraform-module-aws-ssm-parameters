provider "aws" {
  version    = "~> 2.2.0"
  region     = "eu-west-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "disable" {
  source = "../../"

  enabled             = false
  ssm_parameter_count = 0
  prefix              = ""
  names               = []
  types               = []
  values              = []
}
