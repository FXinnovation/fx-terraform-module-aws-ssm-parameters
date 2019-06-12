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

  reboot_ec2_policy_name     = "tftestRebootEC2Policy${random_string.this.result}"
  reboot_ec2_role_name       = "tftestRebootEC2Role${random_string.this.result}"
  read_only_role_name        = "tftestReadOnlyRole${random_string.this.result}"
  ec2_for_ssm_policy_name    = "tftestEC2ForSSMPolicy${random_string.this.result}"
  ec2_for_docker_policy_name = "tftestEC2ForDockerPolicy${random_string.this.result}"
  instance_profile_role_name = "tftestInstanceProfileRole${random_string.this.result}"
  instance_profile_name      = "tftestInstanceProfileName${random_string.this.result}"

  tags {
    Name = "tftest"
  }
}
