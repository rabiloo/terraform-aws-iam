# AWS IAM User submodule

This submodule help create an IAM Gitlab OIDC provider

## Usage

```hcl
module "gitlab_provider" {
  source  = "rabiloo/iam/aws//modules/iam-gitlab-oidc-provider"
  version = "~> 0.3.2"

  url = "https://gitlab.example.com"

  tags = {
    Company = "example"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [tls_certificate.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_thumbprints"></a> [additional\_thumbprints](#input\_additional\_thumbprints) | List of additional thumbprints to add to the thumbprint list. | `list(string)` | `[]` | no |
| <a name="input_client_id_list"></a> [client\_id\_list](#input\_client\_id\_list) | List of client IDs (also known as audiences) for the IAM OIDC provider. Defaults to provider URL if not values are provided. | `list(string)` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created (affects all resources) | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources created | `map(any)` | `{}` | no |
| <a name="input_url"></a> [url](#input\_url) | The URL of the identity provider. Corresponds to the iss claim. The address of your GitLab instance, such as https://gitlab.com or http://gitlab.example.com. | `string` | `"https://gitlab.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN assigned by AWS for this provider |
| <a name="output_url"></a> [url](#output\_url) | The URL of the identity provider. Corresponds to the iss claim |
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
