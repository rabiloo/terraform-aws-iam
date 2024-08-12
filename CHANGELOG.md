# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/rabiloo/terraform-aws-iam/compare/v0.3.2...master)

### Added

- Nothing

### Changed

- Nothing

### Deprecated

- Nothing

### Removed

- Nothing

### Fixed

- Nothing

### Security

- Nothing

<!-- New Release notes will be placed here automatically -->
## [v0.3.2](https://github.com/rabiloo/terraform-aws-iam/compare/v0.3.1...v0.3.2) - 2024-08-12

### What's  changed

* Update documents
* Fix bug: attach user policies on submodule `rabiloo/iam/aws//modules/iam-user`

**Full Changelog**: https://github.com/rabiloo/terraform-aws-iam/compare/v0.3.1...v0.3.2

## [v0.3.1](https://github.com/rabiloo/terraform-aws-iam/compare/v0.3.0...v0.3.1) - 2024-08-12

### What's Changed

* Bump dependabot/fetch-metadata from 1.3.6 to 1.4.0 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/1
* Bump dependabot/fetch-metadata from 1.4.0 to 1.5.1 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/2
* Bump dependabot/fetch-metadata from 1.5.1 to 1.6.0 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/3
* Bump actions/checkout from 3 to 4 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/4
* Bump terraform-linters/setup-tflint from 3 to 4 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/5
* Bump stefanzweifel/git-auto-commit-action from 4 to 5 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/6
* Bump hashicorp/setup-terraform from 2 to 3 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/7
* Bump actions/cache from 3 to 4 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/8
* Bump dependabot/fetch-metadata from 1.6.0 to 2.2.0 by @dependabot in https://github.com/rabiloo/terraform-aws-iam/pull/9
* Add submodule `rabiloo/iam/aws//modules/iam-gitlab-oidc-provider` by @oanhnn
* Add submodule `rabiloo/iam/aws//modules/iam-gitlab-oidc-role` by @oanhnn

### New Contributors

* @dependabot made their first contribution in https://github.com/rabiloo/terraform-aws-iam/pull/1

**Full Changelog**: https://github.com/rabiloo/terraform-aws-iam/compare/v0.3.0...v0.3.1

## [v0.3.0](https://github.com/rabiloo/terraform-aws-iam/compare/v0.2.0...v0.3.0) - 2023-03-31

### Added

- Add Dependabot workflow
- Add auto-update changelog workflow
- Add Terrfaform validate workflow

### Changed

- Update required AWS provider version to `>= 3.52`
- Update Terraform lint workflow
- Update Makefile

## [v0.2.0](https://github.com/rabiloo/terraform-aws-ecr/compare/v0.1.1...v0.2.0) - 2021-08-27

### Added

- Add Lint action in Github Workflow
- Add Makefile
- Add documents for inputs and outputs
- Add validation to `create_iam_user_login_profile` variable of submodule `iam-user`

### Changed

- **Break change** Rename `custom_policy_arns` variable to `custom_policies` in submodule `iam-assumable-role`

## [v0.1.1](https://github.com/rabiloo/terraform-aws-ecr/compare/v0.1.0...v0.1.1) - 2021-08-21

### Fixed

- Fix submodule

## v0.1.0 - 2021-08-21

### Added

- First Release
