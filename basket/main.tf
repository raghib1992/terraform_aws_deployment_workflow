module "basket_management_lambda_function" {
  source                    = "../module/lambda"
  source_dir                = "${path.module}/${var.environment}/lambda"
  lambda_name               = "${var.basket_management_lambda_name}-${var.environment}"
  lambda_description        = var.basket_management_lambda_description
  lambda_role_name          = var.basket_management_lambda_role_name
  lambda_assume_role_policy = file("${path.module}/lambda_assume.json")
  sqs_arn                   = [module.order_save_sqs.SQS_ARN]
  sqs_url                   = module.order_save_sqs.SQS_URL
  lambda_layer_arn          = "arn:aws:lambda:eu-north-1:800643485173:layer:node_modules:1"
  environment_variables = {
    QUEUE_SUBMIT_PAYMENT = "${module.order_save_sqs.SQS_URL}"
    # QUEUE_TRACK_STATUS   = data.aws_caller_identity.current.account_id
  }
  tags = var.tags
}


module "order_save_sqs" {
  source      = "../module/sqs"
  environment = var.environment
  dlq_name    = var.dlq_name
  sqs_name    = var.sqs_name
  tags        = var.tags
}