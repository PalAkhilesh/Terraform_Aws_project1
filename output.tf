output "HTC_POC_OP_618579_DynamoDBTable_Name" {
  value = module.dynamo_db_us-east-1.HTC_POC_OP_618579_DynamoDBTable_Name
}
output "HTC_POC_OP_618579_DynamoDBTable_HashKey_Type" {
    value = module.dynamo_db_us-east-1.HTC_POC_OP_618579_DynamoDBTable_Hash_key_Type
  
}
output "HTC_POC_OP_618579_DynamoDBTable_HashKey" {
  value = module.dynamo_db_us-east-1.HTC_POC_OP_618579_DynamoDBTable_Hash_key
 
}
output "HTC_POC_OP_618579_DynamoDBTable_Billing_Mod" {
  value = module.dynamo_db_us-east-1.HTC_POC_OP_618579_DynamoDBTable_Billing_Mode
 
}
output "HTC_POC_OP_618579_LambdaFunction_CRUD_Function_Name" {
  value = module.lambda_package_us-east-1.HTC_POC_OP_618579_LambdaFunction_CRUD_FunctionName
}
output "HTC_POC_OP_618579_LambdaFunction_Run_time" {
  value = module.lambda_package_us-east-1.HTC_POC_OP_618579_LambdaFunction_Runtime
}
output "HTC_POC_OP_618579_GetFunction"{
  value = module.lambda_package_us-east-1.HTC_POC_OP_618579_LambdaFunction_GET_FunctionName
}
output "HTC_POC_OP_618579_QueueSQSName" {
  value = module.sqs_us-east-1.HTC_POC_OP_618579_QueueSQS_Name
 
}
output "HTC_POC_OP_618579_QueueSQS_URL_" {
  value = module.sqs_us-east-1.HTC_POC_OP_618579_QueueSQS_URL
}
 
output "TAGS" {
  value = module.api_gateway_us-east-1.HTC_POC_OP_618579_APIGateway_Tags
}
output "HTC_POC_OP_618579_APIGateway_Name" {
  value = module.api_gateway_us-east-1.HTC_POC_OP_618579_APIGateway_Name
}
output "HTC_POC_OP_618579_APIGateway_Arn" {
  value = module.api_gateway_us-east-1.HTC_POC_OP_618579_APIGateway_Execution_ARN
 
}