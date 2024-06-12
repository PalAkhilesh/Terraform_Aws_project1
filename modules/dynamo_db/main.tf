################################################################################################
# DYNAMO_DB CREATION
################################################################################################

resource "aws_dynamodb_table" "OM_USECASE_DynamoDBTable" {
  name         = var.OM_USECASE_DynamoDBTable_Name
  billing_mode = var.OM_USECASE_DynamoDBTable_BillingMode
  hash_key     = var.OM_USECASE_DynamoDBTable_HashKey
  attribute {
    name = var.OM_USECASE_DynamoDBTable_HashKey
    type = var.OM_USECASE_DynamoDBTable_AttributeType
  }
  tags        = var.common_tags
}
