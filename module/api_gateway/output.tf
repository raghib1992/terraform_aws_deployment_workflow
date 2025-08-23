output "ApiGatewayId" {
    value = aws_api_gateway_rest_api.api.id  
}

output "ApiGatewayARN" {
    value = aws_api_gateway_rest_api.api.arn  
}


output "ApiGatewayRootResourceId" {
    value= aws_api_gateway_rest_api.api.root_resource_id  
}

output "ApiGatewayExecutionARN" {
    value = aws_api_gateway_rest_api.api.execution_arn  
}