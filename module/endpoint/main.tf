
resource "aws_api_gateway_resource" "api_resource" {
  parent_id   = var.api_gw_root_resource_id
  path_part   = var.parent_path

  rest_api_id = var.api_gw_rest_api_id
}

resource "aws_api_gateway_resource" "child_api_resource" {
  parent_id   = aws_api_gateway_resource.api_resource.id
  path_part   = var.child_path

  rest_api_id = var.api_gw_rest_api_id
}

resource "aws_api_gateway_method" "method" {
  resource_id   = aws_api_gateway_resource.api_resource.id
  rest_api_id   = var.api_gw_rest_api_id
  http_method   = var.http_method
  authorization = "NONE"
}

resource "aws_api_gateway_method" "child_method" {
  resource_id   = aws_api_gateway_resource.child_api_resource.id
  rest_api_id   = var.api_gw_rest_api_id
  http_method   = var.child_http_method
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  http_method             = aws_api_gateway_method.method.http_method
  resource_id             = aws_api_gateway_resource.api_resource.id
  rest_api_id             = var.api_gw_rest_api_id
  integration_http_method = var.http_method
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_api_gateway_integration" "child_lambda_integration" {
  http_method             = aws_api_gateway_method.child_method.http_method
  resource_id             = aws_api_gateway_resource.child_api_resource.id
  rest_api_id             = var.api_gw_rest_api_id
  integration_http_method = var.child_http_method
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = var.api_gw_rest_api_id

  # triggers = {
  #   redeployment = sha1(jsonencode([
  #     aws_api_gateway_resource.yt_api_resource.id,
  #     aws_api_gateway_method.yt_method.id,
  #     aws_api_gateway_integration.lambda_integration.id
  #   ]))
  # }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_api_gateway_integration.lambda_integration,
     aws_api_gateway_integration.child_lambda_integration
  ]
}

resource "aws_api_gateway_stage" "dev_stage" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id   = var.api_gw_rest_api_id
  stage_name    = var.stage_name
}

resource "aws_lambda_permission" "apigw_lambda_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = var.source_arn
}

output "invoke_url" {
  value = aws_api_gateway_stage.dev_stage.invoke_url
  description = "The URL to invoke the API Gateway"
}