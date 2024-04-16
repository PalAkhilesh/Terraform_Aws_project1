output "HTC_POC_OP_618579_LambdaTokenAuthorizer_InvokeARN" {
  value = aws_lambda_function.HTC_POC_OP_618579_LambdaTokenAuthorizer.invoke_arn
}

output "HTC_POC_OP_618579_LambdaFunction_GET_FunctionName" {
  value = aws_lambda_function.HTC_POC_OP_618579_LambdaFunction_GET.function_name
}

output "HTC_POC_OP_618579_LambdaFunction_GET_ARN" {
  value = aws_lambda_function.HTC_POC_OP_618579_LambdaFunction_GET.arn
}
output "HTC_POC_OP_618579_LambdaFunction_Runtime" {
  value = aws_lambda_function.HTC_POC_OP_618579_LambdaFunction_CRUD.runtime
}
output "HTC_POC_OP_618579_LambdaFunction_CRUD_FunctionName" {
  value = aws_lambda_function.HTC_POC_OP_618579_LambdaFunction_CRUD.function_name
}