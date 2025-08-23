##############################
# Common variables
##############################
aws_region     = "eu-north-1"
environment    = "qa"
tags = {
  Name         = "basket Management Lambda"
  Environment  = "qa"
  puspose      = "POC"
}


#######################
### Lambda Function ###
#######################
basket_management_lambda_name    = "basket-management-lambda-qa"
basket_management_lambda_description = "basket Management Lambda Function qa environment"
basket_management_lambda_role_name = "basket-management-lambda-qa-role"
basket_management_tags = {
  Name         = "basket Management Lambda SG"
  Environment  = "qa"
  puspose      = "POC"
}



####################################
### SQS Variables ###
####################################
dlq_name = "order-save-dlq-qa"
sqs_name = "order-save-sqs-qa"