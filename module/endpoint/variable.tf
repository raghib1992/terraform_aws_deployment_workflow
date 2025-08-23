variable "http_method" {
  description = "HTTP method for the API Gateway method"
  type        = string
  default     = "POST"
}

variable "child_http_method" {
  description = "HTTP method for the child API Gateway method"
  type        = string
  default     = "POST"
}

variable "parent_path" {
  description = "The path part for the parent API Gateway resource"
  type        = string
  default     = "bucket"
}

variable "child_path" {
  description = "The path part for the child API Gateway resource"
  type        = string
  default     = "object"
}

variable "api_gw_rest_api_id" {
  description = "The ID of the API Gateway REST API"
  type        = string
}

variable "api_gw_root_resource_id" {
  description = "The root resource ID of the API Gateway"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "The ARN of the Lambda function to integrate with API Gateway"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function to allow API Gateway to invoke"
  type        = string
}

variable "source_arn" {
  description = "The source ARN for the Lambda permission"
  type        = string
}

variable "environment" {
  description = "The environment for the API Gateway stage (e.g., dev, prod)"
  type        = string
  default     = "dev"
}


variable "stage_name" {
  description = "The name of the API Gateway stage"
  type        = string
}