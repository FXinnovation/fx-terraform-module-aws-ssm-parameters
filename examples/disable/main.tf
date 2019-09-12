provider "aws" {
  version    = "~> 2"
  region     = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "disable" {
  source = "../../"

  enabled = false
  prefix  = ""
  names   = []
  types   = []
  values  = []
}
