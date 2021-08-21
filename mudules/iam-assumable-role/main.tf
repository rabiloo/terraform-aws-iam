locals {
  trusted_actions     = compact(distinct(var.trusted_actions))
  trusted_services    = compact(distinct(var.trusted_services))
  trusted_entities    = compact(distinct(var.trusted_entities))
  custom_policy_arns  = compact(distinct(var.custom_policy_arns))
  role_sts_externalid = flatten([var.role_sts_externalid])
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = local.trusted_actions

    principals {
      type        = "Service"
      identifiers = local.trusted_services
    }

    principals {
      type        = "AWS"
      identifiers = local.trusted_entities
    }

    dynamic "condition" {
      for_each = length(local.role_sts_externalid) > 0 ? [true] : []
      content {
        test     = "StringEquals"
        variable = "sts:ExternalId"
        values   = local.role_sts_externalid
      }
    }
  }
}

resource "aws_iam_role" "this" {
  name        = var.name
  path        = var.path
  description = var.description

  force_detach_policies = var.force_detach_policies
  permissions_boundary  = var.permissions_boundary

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = length(local.custom_policy_arns)

  role       = aws_iam_role.this.id
  policy_arn = element(local.custom_policy_arns, count.index)
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0
  name  = var.name
  path  = var.path
  role  = aws_iam_role.this.name

  tags = var.tags
}
