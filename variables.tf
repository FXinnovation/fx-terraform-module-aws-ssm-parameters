#####
# Global variables
####

variable "enabled" {
  description = "Enable this module"
  default     = true
}

variable "tags" {
  description = "Global tags for resources"
  default     = {}
}

#####
# SSM parameters
#####

variable "prefix" {
  description = "The prefix to be used for every SSM Parameters. The prefix must match [A-Za-z0-9/]"
  default     = ""
}

variable "parameters_count" {
  description = "Number of parameters. This value cannot be automaticly computed in terraform 0.12.x."
  type        = number
  default     = 0
}

variable "names" {
  description = "List of names for parameters."
  type        = list(string)
}

variable "descriptions" {
  description = "List of descriptions for parameters."
  type        = list(string)
  default     = []
}

variable "types" {
  description = "List of types for parameters."
  type        = list(string)
}

variable "values" {
  description = "List of values for parameters."
  type        = list(string)
}

variable "overwrites" {
  description = "Ordered list of boolean to say whether if terraform should overwrite an existing parameter not managed by terraform.( `ignore_changes_on_value` should then be used to manage the update behavior)."
  type        = list(bool)
  default     = []
}

variable "ignore_changes_on_value" {
  description = "Whether or not to ignore changes made manually on the value. Applies to all specified parameters. If set to `true`, terraform will never update the value."
  default     = false
}

variable "allowed_patterns" {
  description = "List of regular expression used to validate the parameter value."
  default     = []
}

#####
# KMS key
#####

variable "kms_key_create" {
  description = "Create a kms key for secure string parameters."
  default     = false
}

variable "kms_key_arn" {
  description = "ARN of the kms key if toggle kms_key_create is disable."
  default     = ""
}

variable "kms_key_name" {
  description = "Name of the kms key if toggle kms_key_create is set"
  default     = ""
}

variable "kms_tags" {
  description = "Tags that will be merged with variable tags for the kms key"
  default     = {}
}

variable "kms_key_alias_name" {
  description = "Alias of the kms key if toggle kms_key_create is set"
  default     = ""
}

variable "use_default_kms_key" {
  description = "Use default kms_key"
  default     = false
}

#####
#  IAM Policy
#####

variable "iam_policy_create" {
  description = "Create read only and read write policy to get an access to SSM paramters"
  default     = false
}

variable "iam_policy_name_prefix_read_only" {
  description = "Name of the IAM read only access to SSM parameter policy"
  default     = null
}

variable "iam_policy_name_prefix_read_write" {
  description = "Name of the IAM read write access to SSM parameter policy"
  default     = null
}

variable "iam_policy_path" {
  description = "Path in which to create the policies."
  default     = "/"
}
