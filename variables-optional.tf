
variable lambda_name {
  type        = string
  default     = "lambdaedge_apex_domain_redirect"
  description = "Name of lambda"
}

variable cloudwatch_log_retention_days {
  type        = number
  default     = 14
  description = "Number of days to keep cloudwatch log, set to null to disable"
}

variable tags {
  type        = map(string)
  default     = {}
  description = "AWS Tags for all resources that support tagging"
}