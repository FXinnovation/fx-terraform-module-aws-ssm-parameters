output "arns" {
  value = "${module.disable.arns}"
}

output "names" {
  value = "${module.disable.names}"
}

output "iam_policy_read_only_id" {
  value = "${module.disable.iam_policy_read_only_id}"
}

output "iam_policy_read_only_arn" {
  value = "${module.disable.iam_policy_read_only_arn}"
}

output "iam_policy_read_only_path" {
  value = "${module.disable.iam_policy_read_only_path}"
}
