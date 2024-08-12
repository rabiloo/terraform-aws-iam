################################################################################
# Gitlab OIDC Provider
################################################################################

data "tls_certificate" "this" {
  count = var.create ? 1 : 0

  # See https://github.com/hashicorp/terraform-provider-tls/issues/249
  # url should is format `tls://gitlab.com:443`
  url = "tls://${trimprefix(var.url, "https://")}:443"
}

resource "aws_iam_openid_connect_provider" "this" {
  count = var.create ? 1 : 0

  url             = var.url
  client_id_list  = coalescelist(var.client_id_list, [trimprefix(var.url, "https://")])
  thumbprint_list = distinct(concat(data.tls_certificate.this[0].certificates[*].sha1_fingerprint, var.additional_thumbprints))

  tags = var.tags
}
