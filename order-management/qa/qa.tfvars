##############################
# Common variables
##############################
aws_region     = "eu-north-1"
environment    = "qa"
tags = {
  Name         = "order Management Lambda"
  Environment  = "qa"
  puspose      = "POC"
}


#######################
### Lambda Function ###
#######################
order_management_lambda_name    = "order-management-lambda-qa"
order_management_lambda_description = "order Management Lambda Function qa environment"
order_management_lambda_role_name = "order-management-lambda-qa-role"
order_management_tags = {
  Name         = "order Management Lambda SG"
  Environment  = "qa"
  puspose      = "POC"
}



####################################
### SQS Variables ###
####################################
dlq_name = "order-save-dlq-qa"
sqs_name = "order-save-sqs-qa"