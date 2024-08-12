variable "create" {
  description = "Controls if resources should be created (affects all resources)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to the resources created"
  type        = map(any)
  default     = {}
}

################################################################################
# Gitlab OIDC Provider
################################################################################

variable "client_id_list" {
  description = "List of client IDs (also known as audiences) for the IAM OIDC provider. Defaults to provider URL if not values are provided."
  type        = list(string)
  default     = []
}

variable "url" {
  description = "The URL of the identity provider. Corresponds to the iss claim. The address of your GitLab instance, such as https://gitlab.com or http://gitlab.example.com."
  type        = string
  default     = "https://gitlab.com"

  validation {
    condition     = startswith(var.url, "https://")
    error_message = "The URL must begin with `https://`."
  }

  validation {
    condition     = endswith(var.url, "/")
    error_message = "The URL is not include a trailing slash."
  }
}

variable "additional_thumbprints" {
  description = "List of additional thumbprints to add to the thumbprint list."
  type        = list(string)
  default     = []
}
