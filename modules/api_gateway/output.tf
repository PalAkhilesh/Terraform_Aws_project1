output "OM_USECASE_APIGateway_Execution_ARN" {
  value = aws_api_gateway_rest_api.OM_USECASE_APIGateway.execution_arn
}
output "OM_USECASE_APIGateway_Tags" {
  value = aws_api_gateway_rest_api.OM_USECASE_APIGateway.tags_all
}
output "OM_USECASE_APIGateway_Name" {
  value=aws_api_gateway_rest_api.OM_USECASE_APIGateway.name
}