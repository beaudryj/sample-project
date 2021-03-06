## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 1.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.49.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

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
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "Environment": "Development",<br>  "Region": "us-east-1",<br>  "Terraform": "True",<br>  "Version": "0.0.1"<br>}</pre> | no |

## Outputs

No outputs.
