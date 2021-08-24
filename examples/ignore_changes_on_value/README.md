# SSM parameters Standard exemple

Create SSM parameters, with an overwrite

## Usage

To run this example, you need to execute:

```
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.5 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_overwrite"></a> [overwrite](#module\_overwrite) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Credentials: AWS access key. | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arns"></a> [arns](#output\_arns) | n/a |
| <a name="output_iam_policy_read_only_arn"></a> [iam\_policy\_read\_only\_arn](#output\_iam\_policy\_read\_only\_arn) | n/a |
| <a name="output_iam_policy_read_only_description"></a> [iam\_policy\_read\_only\_description](#output\_iam\_policy\_read\_only\_description) | n/a |
| <a name="output_iam_policy_read_only_id"></a> [iam\_policy\_read\_only\_id](#output\_iam\_policy\_read\_only\_id) | n/a |
| <a name="output_iam_policy_read_only_name"></a> [iam\_policy\_read\_only\_name](#output\_iam\_policy\_read\_only\_name) | n/a |
| <a name="output_iam_policy_read_only_path"></a> [iam\_policy\_read\_only\_path](#output\_iam\_policy\_read\_only\_path) | n/a |
| <a name="output_iam_policy_read_only_policy"></a> [iam\_policy\_read\_only\_policy](#output\_iam\_policy\_read\_only\_policy) | n/a |
| <a name="output_iam_policy_read_write_arn"></a> [iam\_policy\_read\_write\_arn](#output\_iam\_policy\_read\_write\_arn) | n/a |
| <a name="output_iam_policy_read_write_description"></a> [iam\_policy\_read\_write\_description](#output\_iam\_policy\_read\_write\_description) | n/a |
| <a name="output_iam_policy_read_write_id"></a> [iam\_policy\_read\_write\_id](#output\_iam\_policy\_read\_write\_id) | n/a |
| <a name="output_iam_policy_read_write_name"></a> [iam\_policy\_read\_write\_name](#output\_iam\_policy\_read\_write\_name) | n/a |
| <a name="output_iam_policy_read_write_path"></a> [iam\_policy\_read\_write\_path](#output\_iam\_policy\_read\_write\_path) | n/a |
| <a name="output_iam_policy_read_write_policy"></a> [iam\_policy\_read\_write\_policy](#output\_iam\_policy\_read\_write\_policy) | n/a |
| <a name="output_kms_alias_arn"></a> [kms\_alias\_arn](#output\_kms\_alias\_arn) | n/a |
| <a name="output_kms_alias_target_key_arn"></a> [kms\_alias\_target\_key\_arn](#output\_kms\_alias\_target\_key\_arn) | n/a |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | n/a |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | n/a |
| <a name="output_names"></a> [names](#output\_names) | n/a |
| <a name="output_types"></a> [types](#output\_types) | n/a |
| <a name="output_versions"></a> [versions](#output\_versions) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
