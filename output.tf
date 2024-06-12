output "OM_USECASE_DynamoDBTable_Name" {
  value = module.dynamo_db_us-east-1.OM_USECASE_DynamoDBTable_Name
}
output "OM_USECASE_DynamoDBTable_HashKey_Type" {
    value = module.dynamo_db_us-east-1.OM_USECASE_DynamoDBTable_Hash_key_Type
  
}
output "OM_USECASE_DynamoDBTable_HashKey" {
  value = module.dynamo_db_us-east-1.OM_USECASE_DynamoDBTable_Hash_key
 
}
output "OM_USECASE_DynamoDBTable_Billing_Mod" {
  value = module.dynamo_db_us-east-1.OM_USECASE_DynamoDBTable_Billing_Mode
 
}
output "OM_USECASE_LambdaFunction_CRUD_Function_Name" {
  value = module.lambda_package_us-east-1.OM_USECASE_LambdaFunction_CRUD_FunctionName
}
output "OM_USECASE_LambdaFunction_Run_time" {
  value = module.lambda_package_us-east-1.OM_USECASE_LambdaFunction_Runtime
}
output "OM_USECASE_GetFunction"{
  value = module.lambda_package_us-east-1.OM_USECASE_LambdaFunction_GET_FunctionName
}
output "OM_USECASE_QueueSQSName" {
  value = module.sqs_us-east-1.OM_USECASE_QueueSQS_Name
 
}
output "OM_USECASE_QueueSQS_URL_" {
  value = module.sqs_us-east-1.OM_USECASE_QueueSQS_URL
}
 
output "TAGS" {
  value = module.api_gateway_us-east-1.OM_USECASE_APIGateway_Tags
}
output "OM_USECASE_APIGateway_Name" {
  value = module.api_gateway_us-east-1.OM_USECASE_APIGateway_Name
}
output "OM_USECASE_APIGateway_Arn" {
  value = module.api_gateway_us-east-1.OM_USECASE_APIGateway_Execution_ARN
 
}