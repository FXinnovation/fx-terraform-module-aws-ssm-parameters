# terraform-module-aws-ssm-parameters

Generic module to creates SSM Parameters for AWS.

Notes
-----
Very important:
It's not possible to convert `SecureString` into a `String`/`StringList` a value. To do so, SSM parameter resource must be taint/destroy first.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_patterns | List of regular expression used to validate the parameter value. | `list` | `[]` | no |
| descriptions | List of descriptions for parameters. | `list` | `[]` | no |
| enabled | Enable this module | `bool` | `true` | no |
| iam\_policy\_create | Create read only and read write policy to get an access to SSM paramters | `bool` | `false` | no |
| iam\_policy\_name\_prefix\_read\_only | Name of the IAM read only access to SSM parameter policy | `string` | `""` | no |
| iam\_policy\_name\_prefix\_read\_write | Name of the IAM read write access to SSM parameter policy | `string` | `""` | no |
| iam\_policy\_path | Path in which to create the policies. | `string` | `"/"` | no |
| kms\_key\_alias\_name | Alias of the kms key if toggle kms\_key\_create is set | `string` | `""` | no |
| kms\_key\_arn | ARN of the kms key if toggle kms\_key\_create is disable. | `string` | `""` | no |
| kms\_key\_create | Create a kms key for secure string parameters. | `bool` | `false` | no |
| kms\_key\_id | ID of the kms key if toggle kms\_key\_create is disable. | `string` | `""` | no |
| kms\_key\_name | Name of the kms key if toggle kms\_key\_create is set | `string` | `""` | no |
| kms\_tags | Tags that will be merged with variable tags for the kms key | `map` | `{}` | no |
| names | List of names for parameters. | `list(string)` | n/a | yes |
| overwrite | Overwrite an existing parameter | `bool` | `false` | no |
| parameters\_count | Number of parameters. This value cannot be automaticly computed in terraform 0.12.x. | `number` | `0` | no |
| prefix | The prefix to be used for every SSM Parameters. The prefix must match [A-Za-z0-9/] | `string` | n/a | yes |
| tags | Global tags for resources | `map` | `{}` | no |
| types | List of types for parameters. | `list(string)` | n/a | yes |
| use\_default\_kms\_key | Use default kms\_key | `bool` | `false` | no |
| values | List of values for parameters. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arns | ARNs of SSM Parameters |
| iam\_policy\_read\_only\_arn | ARN of the read only policy |
| iam\_policy\_read\_only\_description | The description of the read only policy |
| iam\_policy\_read\_only\_id | ID of the read only policy |
| iam\_policy\_read\_only\_name | The name of the read only policy |
| iam\_policy\_read\_only\_path | Path of the read only policy |
| iam\_policy\_read\_only\_policy | The policy document |
| iam\_policy\_read\_write\_arn | ARN of the read write policy |
| iam\_policy\_read\_write\_description | The description of the read write policy |
| iam\_policy\_read\_write\_id | ID of the read write policy |
| iam\_policy\_read\_write\_name | The name of the read write policy |
| iam\_policy\_read\_write\_path | Path of the read write policy |
| iam\_policy\_read\_write\_policy | The policy document |
| kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| kms\_key\_id | Globally unique identifier for the key |
| names | Names of SSM Parameters |
| types | Types of SSM parameters |
| versions | Versions of SSM parameters |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
