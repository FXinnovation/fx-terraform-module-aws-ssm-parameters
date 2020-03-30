# CHANGELOG

## 1.1.0

* feat: allow default KMS key
* fix: KMS key outputs form list to string. WARNING, THIS IS A BREAKING CHANGE
* fix: module outputs plural now singular: `kms_key_arn`, `kms_key_id` and `kms_alias_arn`. WARNING, THIS IS A BREAKING CHANGE.
* fix: fix terraform pre-processor issue when use a `kms_key_id`
