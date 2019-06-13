output "arns" {
  value = "${module.standard.arns}"
}

output "names" {
  value = "${module.standard.names}"
}

output "iam_policy_read_only_id" {
  value = "${module.standard.iam_policy_read_only_id}"
}

output "iam_policy_read_only_arn" {
  value = "${module.standard.iam_policy_read_only_arn}"
}

output "iam_policy_read_only_path" {
  value = "${module.standard.iam_policy_read_only_path}"
}
