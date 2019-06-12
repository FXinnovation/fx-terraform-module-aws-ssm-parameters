output "iam_role_reboot_ec2_id" {
  description = "The ID of the role ManageEC2LifeCyleRoleForAdministrator."
  value       = "${module.standard.iam_role_reboot_ec2_id}"
}

output "iam_role_reboot_ec2_arn" {
  description = "The ARN of the role ManageEC2LifeCyleRoleForAdministrator."
  value       = "${module.standard.iam_role_reboot_ec2_arn}"
}

output "iam_role_reboot_ec2_name" {
  description = "The name of the role ManageEC2LifeCyleRoleForAdministrator."
  value       = "${module.standard.iam_role_reboot_ec2_name}"
}

output "iam_role_read_only_id" {
  description = "The ID of the role ReadOnlyRoleForEveryOne."
  value       = "${module.standard.iam_role_read_only_id}"
}

output "iam_role_read_only_arn" {
  description = "The ARN of the role ReadOnlyRoleForEveryOne."
  value       = "${module.standard.iam_role_read_only_arn}"
}

output "iam_role_read_only_name" {
  description = "The name of the role ReadOnlyRoleForEveryOne."
  value       = "${module.standard.iam_role_read_only_name}"
}

output "iam_policy_reboot_ec2_id" {
  description = "The ID of the policy RebootEc2."
  value       = "${module.standard.iam_policy_reboot_ec2_id}"
}

output "iam_policy_reboot_ec2_arn" {
  description = "The ARN of the policy RebootEc2."
  value       = "${module.standard.iam_policy_reboot_ec2_arn}"
}

output "iam_policy_reboot_ec2_name" {
  description = "The name of the policy RebootEc2."
  value       = "${module.standard.iam_policy_reboot_ec2_name}"
}

#####
# EC2
#####

output "iam_role_instance_profile_policy_arns" {
  description = "All the policies attached to the instance profle."
  value       = "${module.standard.iam_role_instance_profile_policy_arns}"
}

output "iam_role_instance_profile_id" {
  description = "ID of the IAM role of the Expertus instance profile."
  value       = "${module.standard.iam_role_instance_profile_id}"
}

output "iam_role_instance_profile_arn" {
  description = "ARN of the IAM role of the Expertus instance profile."
  value       = "${module.standard.iam_role_instance_profile_arn}"
}

output "iam_role_instance_profile_name" {
  description = "Name of the IAM role of the Expertus instance profile."
  value       = "${module.standard.iam_role_instance_profile_name}"
}

output "iam_instance_profile_id" {
  description = "ID of the Expertus instance profile."
  value       = "${module.standard.iam_instance_profile_id}"
}

output "iam_instance_profile_arn" {
  description = "ARN of the Expertus instance profile."
  value       = "${module.standard.iam_instance_profile_arn}"
}

output "iam_instance_profile_path" {
  description = "Path of the Expertus instance profile."
  value       = "${module.standard.iam_instance_profile_path}"
}

output "iam_policy_ec2_for_ssm_id" {
  description = "ID of the IAM policy EC2 for SSM."
  value       = "${module.standard.iam_policy_ec2_for_ssm_id}"
}

output "iam_policy_ec2_for_ssm_arn" {
  description = "ARN of the IAM policy EC2 for SSM."
  value       = "${module.standard.iam_policy_ec2_for_ssm_arn}"
}

output "iam_policy_ec2_for_ssm_name" {
  description = "Name of the IAM policy EC2 for SSM."
  value       = "${module.standard.iam_policy_ec2_for_ssm_name}"
}

output "iam_policy_ec2_for_docker_id" {
  description = "ID of the IAM policy EC2 for docker."
  value       = "${module.standard.iam_policy_ec2_for_docker_id}"
}

output "iam_policy_ec2_for_docker_arn" {
  description = "ARN of the IAM policy EC2 for docker."
  value       = "${module.standard.iam_policy_ec2_for_docker_arn}"
}

output "iam_policy_ec2_for_docker_name" {
  description = "Name of the IAM policy EC2 for docker."
  value       = "${module.standard.iam_policy_ec2_for_docker_name}"
}
