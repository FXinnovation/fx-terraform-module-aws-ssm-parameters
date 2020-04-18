# CHANGELOG

## 2.0.0

* fix: Add `parameters_count` variable. You must update you module with this variable, otherwise, no SSM paramters will be created. This fix a terraform 0.12 pre-processor issue.
* tech: Remove `kms_key_id` variable. SSM parameter resource can now accept both KMS key ID or KMS key ARN.

## 1.1.0

* feat: allow default KMS key
* fix: KMS key outputs form list to string. WARNING, THIS IS A BREAKING CHANGE
* fix: module outputs plural now singular: `kms_key_arn`, `kms_key_id` and `kms_alias_arn`. WARNING, THIS IS A BREAKING CHANGE.
* fix: fix terraform pre-processor issue when use a `kms_key_id`
