variable "role_name" {
  description = "The name of the cost exporter IAM role"
  type        = string
}

variable "assumed_by_arn" {
  description = "The ARN of the role / user that the cost exporter IAM role is assumed by"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
