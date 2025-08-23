##############################
# Common variables
##############################
aws_region     = "eu-north-1"
environment    = "sandbox"
tags = {
  Name         = "order Management Lambda"
  Environment  = "dev"
  puspose      = "POC"
}


#######################
### Lambda Function ###
#######################
order_management_lambda_name    = "order-management-lambda"
order_management_lambda_description = "order Management Lambda Function sandbox environment"
order_management_lambda_role_name = "order-management-lambda-sandbox-role"
order_management_tags = {
  Name         = "order Management Lambda SG"
  Environment  = "dev"
  puspose      = "POC"
}



####################################
### SQS Variables ###
####################################
dlq_name = "order-save-dlq"
sqs_name = "order-save-sqs"