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

variable "ssm_parameter_count" {
  description = "Number of parameters to add"
}

variable "prefix" {
  description = "The prefix to be used for every SSM Parameters."
  type        = "string"
}

variable "names" {
  description = "List of names for parameters."
  type        = "list"
}

variable "descriptions" {
  description = "List of descriptions for parameters."
  default     = []
}

variable "types" {
  description = "List of types for parameters."
  type        = "list"
}

variable "values" {
  description = "List of values for parameters."
  type        = "list"
}

variable "overwrite" {
  description = "Overwrite an existing parameter"
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

variable "kms_key_id" {
  description = "ID of the kms key if toggle kms_key_create is disable."
  default     = ""
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

#####
#  IAM Policy
#####

variable "iam_policy_create" {
  description = "Create read only and read write policy to get an access to SSM paramters"
  default     = false
}

variable "iam_policy_name_prefix_read_only" {
  description = "Name of the IAM read only access to SSM parameter policy"
  default     = ""
}

variable "iam_policy_name_prefix_read_write" {
  description = "Name of the IAM read write access to SSM parameter policy"
  default     = ""
}

variable "iam_policy_path" {
  description = "Path in which to create the policies."
  default     = "/"
}
