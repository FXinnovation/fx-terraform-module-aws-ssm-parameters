# CHANGELOG

## 3.0.2

* fix: in versions.tf change from `~> 2.47` to `>= 2.47, < 4.0`
* chore: bump pre-commit hooks

## 3.0.1

* fix: typo in versions.tf to be usable with terraform 0.13

## 3.0.0

* feat: (BREAKING) Rename overwrite and add overwrites variables

## 2.0.1

* fix: Prevent null resource on IAM policy without KMS key

## 2.0.0

* fix: Add `parameters_count` variable. You must update you module with this variable, otherwise, no SSM paramters will be created. This fix a terraform 0.12 pre-processor issue.
* tech: Remove `kms_key_id` variable. SSM parameter resource can now accept both KMS key ID or KMS key ARN.
* tech: Remove old limitation when trying to switch from `SecureString` to `String` since AWS provider 2.47.0 fix an issue [#10819](https://github.com/terraform-providers/terraform-provider-aws/pull/10819)

## 1.1.0

* feat: allow default KMS key
* fix: KMS key outputs form list to string. WARNING, THIS IS A BREAKING CHANGE
* fix: module outputs plural now singular: `kms_key_arn`, `kms_key_id` and `kms_alias_arn`. WARNING, THIS IS A BREAKING CHANGE.
* fix: fix terraform pre-processor issue when use a `kms_key_id`
