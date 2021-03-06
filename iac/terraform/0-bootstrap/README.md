## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 3.30.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | = 3.30.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_assume-role"></a> [assume-role](#module\_assume-role) | git@github.com:beaudryj/sample-iam-role-module.git | n/a |
| <a name="module_group"></a> [group](#module\_group) | git@github.com:beaudryj/sample-iam-group-module.git | n/a |
| <a name="module_user"></a> [user](#module\_user) | git@github.com:beaudryj/sample-iam-user-module.git | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_user_group_membership.membership](https://registry.terraform.io/providers/hashicorp/aws/3.30.0/docs/resources/iam_user_group_membership) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/3.30.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume-role-open-policy](https://registry.terraform.io/providers/hashicorp/aws/3.30.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume-role-root-policy](https://registry.terraform.io/providers/hashicorp/aws/3.30.0/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/3.30.0/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The name of the S3 bucket where state will be stored | `string` | `"home-dev-tf-state"` | no |
| <a name="input_dynamodb_table"></a> [dynamodb\_table](#input\_dynamodb\_table) | The name of the dynamoDB table used to lock the state | `string` | `"home-dev-tf-state"` | no |
| <a name="input_encrypt"></a> [encrypt](#input\_encrypt) | Used to toggle encryption of state bucket | `bool` | `true` | no |
| <a name="input_key"></a> [key](#input\_key) | The key used for the state file | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Name of the AWS region to run in. | `string` | `"us-east-1"` | no |
| <a name="input_role_account_id"></a> [role\_account\_id](#input\_role\_account\_id) | Account id of the role to be assumed | `string` | `""` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | ARN of role to be assumed by backend and provider | `string` | `""` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the role to be assumed | `string` | `""` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | suffix for account type | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "Environment": "Development",<br>  "Region": "us-east-1",<br>  "Version": "0.0.1"<br>}</pre> | no |

## Outputs

No outputs.
