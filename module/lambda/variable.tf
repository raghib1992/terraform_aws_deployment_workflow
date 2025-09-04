variable "source_dir" {
  description = "The source file for the Lambda function"
  type        = string
}

variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_description" {
  description = "The description of the Lambda function"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string
}

variable "lambda_assume_role_policy" {
  description = "The assume role policy for the Lambda function's IAM role"
  type        = string
  default     = null
}

# variable "lambda_policy_arn" {
#   description = "The ARN of the IAM policy to attach to the Lambda function's role"
#   type        = string
# }

variable "sqs_arn" {
  description = "The ARN of the SQS queue to which the Lambda function will send messages"
  type        = list(string)
}

variable "sqs_url" {
  description = "The URL of the SQS queue to which the Lambda function will send messages"
  type        = string
}

variable "lambda_layer_arn" {
  description = "The ARN of the Lambda layer to include in the function"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Lambda function"
  type        = map(string)
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
}