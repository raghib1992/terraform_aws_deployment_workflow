module "order_management_lambda_function" {
  source                    = "../module/lambda"
  source_dir                = "${path.module}/${var.environment}/lambda"
  lambda_name               = "${var.order_management_lambda_name}-${var.environment}"
  lambda_description        = var.order_management_lambda_description
  lambda_role_name          = var.order_management_lambda_role_name
  lambda_assume_role_policy = file("${path.module}/lambda_assume.json")
  sqs_arn                   = ["arn:aws:sqs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${var.sqs_name}"]
  sqs_url                   = "https://sqs.${var.aws_region}.amazonaws.com/${data.aws_caller_identity.current.account_id}/${var.sqs_name}"
  lambda_layer_arn          = "arn:aws:lambda:eu-north-1:800643485173:layer:node_modules:1"
  environment_variables = {
    QUEUE_SUBMIT_PAYMENT = "https://sqs.${var.aws_region}.amazonaws.com/${data.aws_caller_identity.current.account_id}/${var.sqs_name}"
    # QUEUE_TRACK_STATUS   = data.aws_caller_identity.current.account_id
  }
  tags = var.tags
}



data "aws_caller_identity" "current" {}