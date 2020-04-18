# No policies with an external KMS key exemple

Create SSM parameters using an external KMS key and don't create policies

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
| terraform | >= 0.12 |
| aws | ~> 2 |
| aws | ~>2.47 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2 ~>2.47 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | Credentials: AWS access key. | `string` | n/a | yes |
| secret\_key | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arns | n/a |
| iam\_policy\_read\_only\_arn | n/a |
| iam\_policy\_read\_only\_description | n/a |
| iam\_policy\_read\_only\_id | n/a |
| iam\_policy\_read\_only\_name | n/a |
| iam\_policy\_read\_only\_path | n/a |
| iam\_policy\_read\_only\_policy | n/a |
| iam\_policy\_read\_write\_arn | n/a |
| iam\_policy\_read\_write\_description | n/a |
| iam\_policy\_read\_write\_id | n/a |
| iam\_policy\_read\_write\_name | n/a |
| iam\_policy\_read\_write\_path | n/a |
| iam\_policy\_read\_write\_policy | n/a |
| kms\_alias\_arn | n/a |
| kms\_alias\_target\_key\_arn | n/a |
| kms\_key\_arn | n/a |
| kms\_key\_id | n/a |
| names | n/a |
| types | n/a |
| versions | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
