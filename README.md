# AWS IAM Terraform module

Terraform module which creates some IAM resources on AWS.

## Usage

```hcl
module "user" {
  source  = "rabiloo/iam/aws//modules/iam-user"
  version = "~> 0.1.1"

  name = "deployer"
  path = "/service-users/"

  tags = {
    Owner   = "user"
    Service = "app-name"
  }
}

module "role" {
  source  = "rabiloo/iam/aws//modules/iam-assumable-role"
  version = "~> 0.1.1"

  name = "custom-ecs-task-role"
  path = "/service-roles/"

  trusted_services   = ["ecs-tasks.amazonaws.com"]
  custom_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]

  tags = {
    Owner   = "user"
    Service = "app-name"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| Terraform | `~> 1.0` |

## Providers

| Name | Version |
|------|---------|
| aws  | `~> 3.52` |

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/rabiloo/terraform-aws-iam/issues).

## License

This project is released under the MIT License.   
Copyright © 2021 [Rabiloo Co., Ltd](https://rabiloo.com)   
Please see [License File](LICENSE) for more information.
