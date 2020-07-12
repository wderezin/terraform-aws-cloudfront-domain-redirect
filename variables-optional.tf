
variable lambda_name {
  type        = string
  default     = "cloudfront_apex_domain_redirect"
  description = "Name of lambda"
}

variable tags {
  type        = map(string)
  default     = {}
  description = "AWS Tags for all resources that support tagging"
}