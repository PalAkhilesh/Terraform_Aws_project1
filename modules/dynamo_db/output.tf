output "HTC_POC_OP_618579_DynamoDBTable_Name" {
  value = aws_dynamodb_table.HTC_POC_OP_618579_DynamoDBTable.name
}
output "HTC_POC_OP_618579_DynamoDBTable_Hash_key_Type" {
  value = var.HTC_POC_OP_618579_DynamoDBTable_AttributeType
  
}
output "HTC_POC_OP_618579_DynamoDBTable_Hash_key" {
  value = aws_dynamodb_table.HTC_POC_OP_618579_DynamoDBTable.hash_key
}
output "HTC_POC_OP_618579_DynamoDBTable_Billing_Mode" {
  value = aws_dynamodb_table.HTC_POC_OP_618579_DynamoDBTable.billing_mode
}