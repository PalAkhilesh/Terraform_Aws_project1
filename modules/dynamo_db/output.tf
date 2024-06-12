output "OM_USECASE_DynamoDBTable_Name" {
  value = aws_dynamodb_table.OM_USECASE_DynamoDBTable.name
}
output "OM_USECASE_DynamoDBTable_Hash_key_Type" {
  value = var.OM_USECASE_DynamoDBTable_AttributeType
  
}
output "OM_USECASE_DynamoDBTable_Hash_key" {
  value = aws_dynamodb_table.OM_USECASE_DynamoDBTable.hash_key
}
output "OM_USECASE_DynamoDBTable_Billing_Mode" {
  value = aws_dynamodb_table.OM_USECASE_DynamoDBTable.billing_mode
}