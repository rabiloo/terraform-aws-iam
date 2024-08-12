# AWS IAM Assumablee Role submodule

This submodule help create an IAM assumable role

## Usage

```hcl
module "role" {
  source  = "rabiloo/iam/aws//modules/iam-assumable-role"
  version = "~> 0.3.0"

  name = "custom-ecs-task-role"
  path = "/service-roles/"

  trusted_services = ["ecs-tasks.amazonaws.com"]
  custom_policies  = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]

  tags = {
    Owner   = "user"
    Service = "app-name"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.52 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=3.52 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Desired name for the IAM role | `string` | n/a | yes |
| <a name="input_create_instance_profile"></a> [create\_instance\_profile](#input\_create\_instance\_profile) | Whether to create an instance profile | `bool` | `false` | no |
| <a name="input_custom_policies"></a> [custom\_policies](#input\_custom\_policies) | List of ARNs of IAM policies to attach to IAM role | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Desired description for the IAM role | `string` | `"This is a customized role"` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Whether policies should be detached from this role when destroying | `bool` | `false` | no |
| <a name="input_path"></a> [path](#input\_path) | Desired path for the IAM role | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | Permissions boundary ARN to use for this IAM role | `string` | `""` | no |
| <a name="input_role_sts_externalid"></a> [role\_sts\_externalid](#input\_role\_sts\_externalid) | STS ExternalId condition values to use with a role (when MFA is not required) | `any` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to IAM role resources | `map(string)` | `{}` | no |
| <a name="input_trusted_actions"></a> [trusted\_actions](#input\_trusted\_actions) | Actions of STS | `list(string)` | <pre>[<br>  "sts:AssumeRole"<br>]</pre> | no |
| <a name="input_trusted_entities"></a> [trusted\_entities](#input\_trusted\_entities) | List of ARNs of AWS entities who can assume these roles | `list(string)` | `[]` | no |
| <a name="input_trusted_services"></a> [trusted\_services](#input\_trusted\_services) | List of AWS Services that can assume these roles | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_instance_profile_arn"></a> [iam\_instance\_profile\_arn](#output\_iam\_instance\_profile\_arn) | ARN of IAM instance profile |
| <a name="output_iam_instance_profile_name"></a> [iam\_instance\_profile\_name](#output\_iam\_instance\_profile\_name) | Name of IAM instance profile |
| <a name="output_iam_instance_profile_path"></a> [iam\_instance\_profile\_path](#output\_iam\_instance\_profile\_path) | Path of IAM instance profile |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of IAM role |
| <a name="output_iam_role_path"></a> [iam\_role\_path](#output\_iam\_role\_path) | Path of IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_role_sts_externalid"></a> [role\_sts\_externalid](#output\_role\_sts\_externalid) | STS ExternalId condition value to use with a role |
<!-- END_TF_DOCS -->

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/rabiloo/terraform-aws-iam/issues).

## License

This project is released under the MIT License.   
Copyright © 2024 [Rabiloo Co., Ltd](https://rabiloo.com)   
Please see [License File](https://github.com/rabiloo/terraform-aws-iam/blob/master/LICENSE) for more information.
