output "OM_USECASE_LambdaTokenAuthorizer_InvokeARN" {
  value = aws_lambda_function.OM_USECASE_LambdaTokenAuthorizer.invoke_arn
}

output "OM_USECASE_LambdaFunction_GET_FunctionName" {
  value = aws_lambda_function.OM_USECASE_LambdaFunction_GET.function_name
}

output "OM_USECASE_LambdaFunction_GET_ARN" {
  value = aws_lambda_function.OM_USECASE_LambdaFunction_GET.arn
}
output "OM_USECASE_LambdaFunction_Runtime" {
  value = aws_lambda_function.OM_USECASE_LambdaFunction_CRUD.runtime
}
output "OM_USECASE_LambdaFunction_CRUD_FunctionName" {
  value = aws_lambda_function.OM_USECASE_LambdaFunction_CRUD.function_name
}