locals {
  api_name = var.api_name
  final_api_name = "${local.api_name}-${var.environment}"
}

# aws_api_gateway_rest_api #
resource "aws_api_gateway_rest_api" "api" {
  name        = local.final_api_name
  description = var.api_description

  endpoint_configuration {
    types = [ var.endpoint_type ]
  }

    tags = var.tags
}

resource "aws_api_gateway_resource" "api_resource" {
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "basket"

  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_resource" "child_api_resource" {
  parent_id   = aws_api_gateway_resource.api_resource.id
  path_part   = "{basket-id}"

  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_method" "method" {
  resource_id   = aws_api_gateway_resource.api_resource.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "child_method" {
  resource_id   = aws_api_gateway_resource.child_api_resource.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  http_method             = aws_api_gateway_method.method.http_method
  resource_id             = aws_api_gateway_resource.api_resource.id
  rest_api_id             = aws_api_gateway_rest_api.api.id
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = data.terraform_remote_state.basket.outputs.bucket_management_lambda_invoke_arn
}

resource "aws_api_gateway_integration" "child_lambda_integration" {
  http_method             = aws_api_gateway_method.child_method.http_method
  resource_id             = aws_api_gateway_resource.child_api_resource.id
  rest_api_id             = aws_api_gateway_rest_api.api.id
  integration_http_method = "GET"
  type                    = "AWS_PROXY"
  uri                     = data.terraform_remote_state.basket.outputs.bucket_management_lambda_invoke_arn
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id

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
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = "order-domain"
}

resource "aws_lambda_permission" "apigw_lambda_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = data.terraform_remote_state.basket.outputs.bucket_management_lambda_name
  principal     = "apigateway.amazonaws.com"
  source_arn    =  "${aws_api_gateway_rest_api.api.execution_arn}/*/*/*"
}

output "invoke_url" {
  value = aws_api_gateway_stage.dev_stage.invoke_url
  description = "The URL to invoke the API Gateway"
}