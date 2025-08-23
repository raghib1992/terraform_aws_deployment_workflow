variable "dlq_name" {
  description = "The name of the dead letter queue"
  type        = string
}

variable "sqs_name" {
  description = "The name of the main SQS queue"
  type        = string
}

variable "environment" {
  description = "The environment for which the resources are being created"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the SQS queues"
  type        = map(string)
}