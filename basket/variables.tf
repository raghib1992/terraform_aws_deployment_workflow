#########################
#### Provider Region ####
#########################
# This variable is used to specify the AWS region for the Lambda function and other resources.
variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

variable "environment" {
  description = "Name of the security group"
  type        = string
}
###################################
#### Lambda Function Variables ####
###################################
# These variables are used to configure the Lambda function, including its name, role, handler,


variable "basket_management_lambda_name" {
  description = "Name of the basket management Lambda function"
  type        = string
}


variable "basket_management_lambda_description" {
  description = "value of the handler in the code"
  type        = string
}

variable "basket_management_lambda_role_name" {
  description = "Path to the source code zip file for Lambda Function"
  type        = string
}


variable "basket_management_tags" {
  description = "Tags for the resources"
  type        = map(string)
}

#######################################
####### SQS Variables ##########
#######################################

variable "sqs_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "dlq_name" {
  description = "Name of the dead letter queue"
  type        = string
}
