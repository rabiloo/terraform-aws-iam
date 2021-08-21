variable "name" {
  description = "Desired name for the IAM role"
  type        = string

  validation {
    condition     = var.name != ""
    error_message = "The name MUST be not empty."
  }

  validation {
    condition     = var.name == replace(var.name, "/[^a-zA-Z0-9-_]+/", "")
    error_message = "The name MUST be alphanumeric and can contain dashes and underscores."
  }
}

variable "path" {
  description = "Desired path for the IAM role"
  type        = string
  default     = "/"

  validation {
    condition     = var.path == replace(var.path, "/[^a-zA-Z0-9-_\\/]+/", "")
    error_message = "The path MUST be alphanumeric and can contain dashes, underscores and slashs."
  }
}

variable "description" {
  description = "Desired description for the IAM role"
  type        = string
  default     = "This is a customized role"
}

variable "trusted_actions" {
  description = "Actions of STS"
  type        = list(string)
  default     = ["sts:AssumeRole"]
}

variable "trusted_services" {
  description = "AWS Services that can assume these roles"
  type        = list(string)
  default     = []
}

variable "trusted_entities" {
  description = "ARNs of AWS entities who can assume these roles"
  type        = list(string)
  default     = []
}

variable "role_sts_externalid" {
  description = "STS ExternalId condition values to use with a role (when MFA is not required)"
  type        = any
  default     = []
}

variable "custom_policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  default     = []
}

variable "force_detach_policies" {
  description = "Whether policies should be detached from this role when destroying"
  type        = bool
  default     = false
}

variable "permissions_boundary" {
  description = "Permissions boundary ARN to use for this IAM role"
  type        = string
  default     = ""
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to IAM role resources"
  type        = map(string)
  default     = {}
}
