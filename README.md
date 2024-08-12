# AWS IAM Terraform module

Terraform module which creates some IAM resources on AWS.

## Usage

```hcl
module "gitlab_provider" {
  source  = "rabiloo/iam/aws//modules/iam-gitlab-oidc-provider"
  version = "~> 0.4.0"

  url = "https://gitlab.example.com"

  tags = {
    Company = "example"
  }
}

module "gitlab_deployer_role" {
  source  = "rabiloo/iam/aws//modules/iam-gitlab-oidc-role"
  version = "~> 0.4.0"

  name_prefix  = "gitlab-ci-deployer-"
  path         = "/service-roles/"
  provider_url = module.gitlab_provider.url
  subjects     = ["my-org/my-repo"]

  tags = {
    Namespace = "my-org"
    Project = "my-repo"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Development

1. Install `opentofu`, `terrform`, `tflint`, `terraform-docs` and `make`
2. Using make

```
make help
```

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/rabiloo/terraform-aws-iam/issues).

## License

This project is released under the MIT License.   
Copyright © 2023 [Rabiloo Co., Ltd](https://rabiloo.com)   
Please see [License File](LICENSE) for more information.
