# terraform-module-aws-ssm-parameters

Generic module to creates SSM Parameters for AWS.

Notes
-----
Very important:
It's not possible to convert `SecureString` into a `String`/`StringList` a value. To do so, SSM parameter resource must be taint/destroy first.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allowed\_patterns | List of regular expression used to validate the parameter value. | list | `[]` | no |
| descriptions | List of descriptions for parameters. | list | `[]` | no |
| enabled | Enable this module | string | `"true"` | no |
| iam\_policy\_create | Create read only and read write policy to get an access to SSM paramters | string | `"false"` | no |
| iam\_policy\_name\_prefix\_read\_only | Name of the IAM read only access to SSM parameter policy | string | `""` | no |
| iam\_policy\_name\_prefix\_read\_write | Name of the IAM read write access to SSM parameter policy | string | `""` | no |
| iam\_policy\_path | Path in which to create the policies. | string | `"/"` | no |
| kms\_key\_alias\_name | Alias of the kms key if toggle kms_key_create is set | string | `""` | no |
| kms\_key\_arn | ARN of the kms key if toggle kms_key_create is disable. | string | `""` | no |
| kms\_key\_create | Create a kms key for secure string parameters. | string | `"false"` | no |
| kms\_key\_id | ID of the kms key if toggle kms_key_create is disable. | string | `""` | no |
| kms\_key\_name | Name of the kms key if toggle kms_key_create is set | string | `""` | no |
| kms\_tags | Tags that will be merged with variable tags for the kms key | map | `{}` | no |
| names | List of names for parameters. | list | n/a | yes |
| overwrite | Overwrite an existing parameter | string | `"false"` | no |
| prefix | The prefix to be used for every SSM Parameters. The prefix must match [A-Za-z0-9/] | string | n/a | yes |
| ssm\_parameter\_count | Number of parameters to add | string | n/a | yes |
| tags | Global tags for resources | map | `{}` | no |
| types | List of types for parameters. | list | n/a | yes |
| values | List of values for parameters. | list | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arns | ARNs of SSM Parameters |
| iam\_policy\_read\_only\_arn | ARN of the read only policy |
| iam\_policy\_read\_only\_id | ID of the read only policy |
| iam\_policy\_read\_only\_path | Path of the read only policy |
| iam\_policy\_read\_write\_arn | ARN of the read write policy |
| iam\_policy\_read\_write\_id | ID of the read write policy |
| iam\_policy\_read\_write\_path | Path of the read write policy |
| names | Names of SSM Parameters |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
