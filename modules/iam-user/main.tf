locals {
  custom_policy_arns = compact(distinct(var.custom_policy_arns))
}

resource "aws_iam_user" "this" {
  name                 = var.name
  path                 = var.path
  force_destroy        = var.force_destroy
  permissions_boundary = var.permissions_boundary

  tags = var.tags
}

resource "aws_iam_user_login_profile" "this" {
  count = var.create_iam_user_login_profile ? 1 : 0

  user                    = aws_iam_user.this.name
  pgp_key                 = var.pgp_key
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
}

resource "aws_iam_access_key" "this" {
  count = var.create_iam_access_key && var.pgp_key != "" ? 1 : 0

  user    = aws_iam_user.this.name
  pgp_key = var.pgp_key
}

resource "aws_iam_access_key" "this_no_pgp" {
  count = var.create_iam_access_key && var.pgp_key == "" ? 1 : 0

  user = aws_iam_user.this.name
}

resource "aws_iam_user_ssh_key" "this" {
  count = var.upload_iam_user_ssh_key ? 1 : 0

  username   = aws_iam_user.this.name
  encoding   = var.ssh_key_encoding
  public_key = var.ssh_public_key
}

resource "aws_iam_user_policy_attachment" "custom" {
  for_each = local.custom_policy_arns

  user       = aws_iam_user.this.name
  policy_arn = each.value
}
