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