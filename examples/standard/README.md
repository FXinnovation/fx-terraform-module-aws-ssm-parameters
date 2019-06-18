# SSM parameters Standard exemple

Create SSM parameters, KMS key, and the policies

## Usage

To run this example, you need to execute:

```
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access\_key | Credentials: AWS access key. | string | n/a | yes |
| secret\_key | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arns |  |
| iam\_policy\_read\_only\_arn |  |
| iam\_policy\_read\_only\_id |  |
| iam\_policy\_read\_only\_path |  |
| iam\_policy\_read\_write\_arn |  |
| iam\_policy\_read\_write\_id |  |
| iam\_policy\_read\_write\_path |  |
| names |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
