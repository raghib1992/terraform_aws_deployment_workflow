##############################
# Common variables
##############################
aws_region     = "eu-north-1"
environment    = "dev"
tags = {
  Name         = "basket Management Lambda"
  Environment  = "dev"
  puspose      = "POC"
}


#######################
### Lambda Function ###
#######################
basket_management_lambda_name    = "basket-management-lambda-dev"
basket_management_lambda_description = "basket Management Lambda Function dev environment"
basket_management_lambda_role_name = "basket-management-lambda-dev-role"
basket_management_tags = {
  Name         = "basket Management Lambda SG"
  Environment  = "dev"
  puspose      = "POC"
}



####################################
### SQS Variables ###
####################################
dlq_name = "order-save-dlq-dev"
sqs_name = "order-save-sqs-dev"