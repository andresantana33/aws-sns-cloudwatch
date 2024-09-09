#-------------------
# SNS
#-------------------
variable "sns_topic_config" {
  type = map(object({
    name         = string
    display_name = string
  }))
}

variable "sns_topic_subscription_email" {
  type = map(object({
    topic_name = string
    protocol   = string
    endpoint   = string
  }))
}

variable "region" {
  description = "environment region"
  type        = string
  default     = "us-east-1"
}












