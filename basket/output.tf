output "bucket_management_lambda_invoke_arn" {
#   value = aws_lambda_function.lambda_function.invoke_arn
    value = module.basket_management_lambda_function.lambda_function_invoke_arn
}

output "bucket_management_lambda_name" {
  value = module.basket_management_lambda_function.lambda_function_name
}