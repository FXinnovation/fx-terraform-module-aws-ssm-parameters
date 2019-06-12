# Common IAM Standard exemple

Create all the policies and roles

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
| iam\_instance\_profile\_arn | ARN of the Expertus instance profile. |
| iam\_instance\_profile\_id | ID of the Expertus instance profile. |
| iam\_instance\_profile\_path | Path of the Expertus instance profile. |
| iam\_policy\_ec2\_for\_docker\_arn | ARN of the IAM policy EC2 for docker. |
| iam\_policy\_ec2\_for\_docker\_id | ID of the IAM policy EC2 for docker. |
| iam\_policy\_ec2\_for\_docker\_name | Name of the IAM policy EC2 for docker. |
| iam\_policy\_ec2\_for\_ssm\_arn | ARN of the IAM policy EC2 for SSM. |
| iam\_policy\_ec2\_for\_ssm\_id | ID of the IAM policy EC2 for SSM. |
| iam\_policy\_ec2\_for\_ssm\_name | Name of the IAM policy EC2 for SSM. |
| iam\_policy\_reboot\_ec2\_arn | The ARN of the policy RebootEc2. |
| iam\_policy\_reboot\_ec2\_id | The ID of the policy RebootEc2. |
| iam\_policy\_reboot\_ec2\_name | The name of the policy RebootEc2. |
| iam\_role\_instance\_profile\_arn | ARN of the IAM role of the Expertus instance profile. |
| iam\_role\_instance\_profile\_id | ID of the IAM role of the Expertus instance profile. |
| iam\_role\_instance\_profile\_name | Name of the IAM role of the Expertus instance profile. |
| iam\_role\_instance\_profile\_policy\_arns | All the policies attached to the instance profle. |
| iam\_role\_read\_only\_arn | The ARN of the role ReadOnlyRoleForEveryOne. |
| iam\_role\_read\_only\_id | The ID of the role ReadOnlyRoleForEveryOne. |
| iam\_role\_read\_only\_name | The name of the role ReadOnlyRoleForEveryOne. |
| iam\_role\_reboot\_ec2\_arn | The ARN of the role ManageEC2LifeCyleRoleForAdministrator. |
| iam\_role\_reboot\_ec2\_id | The ID of the role ManageEC2LifeCyleRoleForAdministrator. |
| iam\_role\_reboot\_ec2\_name | The name of the role ManageEC2LifeCyleRoleForAdministrator. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
