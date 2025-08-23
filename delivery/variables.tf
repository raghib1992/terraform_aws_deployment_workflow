variable "queue_name" {
  description = "Name of the SQS queue."
  type        = string
}

variable "dead_letter_queue_name" {
  description = "Name of the dead letter SQS queue."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "project" {
  description = "Project name."
  type        = string
}
