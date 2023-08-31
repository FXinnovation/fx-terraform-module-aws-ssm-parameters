# terraform-module-aws-ssm-parameters

Generic module to creates SSM Parameters for AWS.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.read_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.read_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_ssm_parameter.do_not_ignore_changes_on_value](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.ignore_changes_on_value](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.kms_key_read_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kms_key_read_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.read_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.read_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_patterns"></a> [allowed\_patterns](#input\_allowed\_patterns) | List of regular expression used to validate the parameter value. | `list(string)` | `[]` | no |
| <a name="input_descriptions"></a> [descriptions](#input\_descriptions) | List of descriptions for parameters. | `list(string)` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable this module | `bool` | `true` | no |
| <a name="input_iam_policy_create"></a> [iam\_policy\_create](#input\_iam\_policy\_create) | Create read only and read write policy to get an access to SSM paramters | `bool` | `false` | no |
| <a name="input_iam_policy_name_prefix_read_only"></a> [iam\_policy\_name\_prefix\_read\_only](#input\_iam\_policy\_name\_prefix\_read\_only) | Name of the IAM read only access to SSM parameter policy | `string` | `null` | no |
| <a name="input_iam_policy_name_prefix_read_write"></a> [iam\_policy\_name\_prefix\_read\_write](#input\_iam\_policy\_name\_prefix\_read\_write) | Name of the IAM read write access to SSM parameter policy | `string` | `null` | no |
| <a name="input_iam_policy_path"></a> [iam\_policy\_path](#input\_iam\_policy\_path) | Path in which to create the policies. | `string` | `"/"` | no |
| <a name="input_ignore_changes_on_value"></a> [ignore\_changes\_on\_value](#input\_ignore\_changes\_on\_value) | Whether or not to ignore changes made manually on the value. Applies to all specified parameters. If set to `true`, terraform will never update the value. | `bool` | `false` | no |
| <a name="input_kms_key_alias_name"></a> [kms\_key\_alias\_name](#input\_kms\_key\_alias\_name) | Alias of the kms key if toggle kms\_key\_create is set | `string` | `""` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | ARN of the kms key if toggle kms\_key\_create is disable. | `string` | `""` | no |
| <a name="input_kms_key_create"></a> [kms\_key\_create](#input\_kms\_key\_create) | Create a kms key for secure string parameters. | `bool` | `false` | no |
| <a name="input_kms_key_name"></a> [kms\_key\_name](#input\_kms\_key\_name) | Name of the kms key if toggle kms\_key\_create is set | `string` | `""` | no |
| <a name="input_kms_tags"></a> [kms\_tags](#input\_kms\_tags) | Tags that will be merged with variable tags for the kms key | `map(any)` | `{}` | no |
| <a name="input_names"></a> [names](#input\_names) | List of names for parameters. | `list(string)` | n/a | yes |
| <a name="input_overwrites"></a> [overwrites](#input\_overwrites) | Ordered list of boolean to say whether if terraform should overwrite an existing parameter not managed by terraform.( `ignore_changes_on_value` should then be used to manage the update behavior). | `list(bool)` | `[]` | no |
| <a name="input_parameters_count"></a> [parameters\_count](#input\_parameters\_count) | Number of parameters. This value cannot be automaticly computed in terraform 0.12.x. | `number` | `0` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix to be used for every SSM Parameters. The prefix must match [A-Za-z0-9/] | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global tags for resources | `map(any)` | `{}` | no |
| <a name="input_types"></a> [types](#input\_types) | List of types for parameters. | `list(string)` | n/a | yes |
| <a name="input_use_default_kms_key"></a> [use\_default\_kms\_key](#input\_use\_default\_kms\_key) | Use default kms\_key | `bool` | `false` | no |
| <a name="input_values"></a> [values](#input\_values) | List of values for parameters. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arns"></a> [arns](#output\_arns) | ARNs of SSM Parameters |
| <a name="output_iam_policy_read_only_arn"></a> [iam\_policy\_read\_only\_arn](#output\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_iam_policy_read_only_description"></a> [iam\_policy\_read\_only\_description](#output\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_iam_policy_read_only_id"></a> [iam\_policy\_read\_only\_id](#output\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_iam_policy_read_only_name"></a> [iam\_policy\_read\_only\_name](#output\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_iam_policy_read_only_path"></a> [iam\_policy\_read\_only\_path](#output\_iam\_policy\_read\_only\_path) | Path of the read only policy |
| <a name="output_iam_policy_read_only_policy"></a> [iam\_policy\_read\_only\_policy](#output\_iam\_policy\_read\_only\_policy) | The policy document |
| <a name="output_iam_policy_read_write_arn"></a> [iam\_policy\_read\_write\_arn](#output\_iam\_policy\_read\_write\_arn) | ARN of the read write policy |
| <a name="output_iam_policy_read_write_description"></a> [iam\_policy\_read\_write\_description](#output\_iam\_policy\_read\_write\_description) | The description of the read write policy |
| <a name="output_iam_policy_read_write_id"></a> [iam\_policy\_read\_write\_id](#output\_iam\_policy\_read\_write\_id) | ID of the read write policy |
| <a name="output_iam_policy_read_write_name"></a> [iam\_policy\_read\_write\_name](#output\_iam\_policy\_read\_write\_name) | The name of the read write policy |
| <a name="output_iam_policy_read_write_path"></a> [iam\_policy\_read\_write\_path](#output\_iam\_policy\_read\_write\_path) | Path of the read write policy |
| <a name="output_iam_policy_read_write_policy"></a> [iam\_policy\_read\_write\_policy](#output\_iam\_policy\_read\_write\_policy) | The policy document |
| <a name="output_kms_alias_arn"></a> [kms\_alias\_arn](#output\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_kms_alias_target_key_arn"></a> [kms\_alias\_target\_key\_arn](#output\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_names"></a> [names](#output\_names) | Names of SSM Parameters |
| <a name="output_types"></a> [types](#output\_types) | Types of SSM parameters |
| <a name="output_versions"></a> [versions](#output\_versions) | Versions of SSM parameters |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
