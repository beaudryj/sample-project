#############################
# Backend Variables
#############################
variable "region" {
  description = "Name of the AWS region to run in."
  type        = string
  default     = "us-east-1"
}

variable "bucket" {
  description = "The name of the S3 bucket where state will be stored"
  type        = string
  default     = "home-dev-tf-state"
}

variable "dynamodb_table" {
  description = "The name of the dynamoDB table used to lock the state"
  type        = string
  default     = "home-dev-tf-state"
}

variable "key" {
  description = "The key used for the state file"
  type        = string
}

variable "encrypt" {
  description = "Used to toggle encryption of state bucket"
  type        = bool
  default     = true
}

variable "role_arn" {
  description = "ARN of role to be assumed by backend and provider"
  type        = string
  default     = ""
}

variable "role_account_id" {
  description = "Account id of the role to be assumed"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "Name of the role to be assumed"
  type        = string
  default     = ""
}

variable "suffix" {
  description = "suffix for account type"
  type        = string
  default     = ""
}

variable "tags" {
  type = map(any)
  default = {
    Environment = "Development"
    Region      = "us-east-1"
    Version     = "0.0.1"
  }
}
