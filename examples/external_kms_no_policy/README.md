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
| iam\_policy\_read\_only\_description |  |
| iam\_policy\_read\_only\_id |  |
| iam\_policy\_read\_only\_name |  |
| iam\_policy\_read\_only\_path |  |
| iam\_policy\_read\_only\_policy |  |
| iam\_policy\_read\_write\_arn |  |
| iam\_policy\_read\_write\_description |  |
| iam\_policy\_read\_write\_id |  |
| iam\_policy\_read\_write\_name |  |
| iam\_policy\_read\_write\_path |  |
| iam\_policy\_read\_write\_policy |  |
| kms\_alias\_arns |  |
| kms\_alias\_target\_key\_arn |  |
| kms\_key\_arns |  |
| kms\_key\_ids |  |
| names |  |
| types |  |
| versions |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
