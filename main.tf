###############################################################################################
# us-east-1
###############################################################################################

################################################################################################
# IAM MODULE
################################################################################################


module "iam" {
  providers = {
    aws = aws.us-east-1

  }

  source             = "./Global/modules/iam"

  policy_description = var.policy_description

  policy_attachment  = var.policy_attachment

  policy_name        = var.policy_name

  role_name          = var.role_name
  

   
}

################################################################################################
# DYNAMO_DB MODULE
################################################################################################
module "dynamo_db_us-east-1" {

  source = "./modules/dynamo_db"
  providers = {
    aws = aws.us-east-1

  }

  OM_USECASE_DynamoDBTable_Name          = var.OM_USECASE_DynamoDBTable_Name
  OM_USECASE_DynamoDBTable_BillingMode   = var.OM_USECASE_DynamoDBTable_BillingMode
  OM_USECASE_DynamoDBTable_HashKey       = var.OM_USECASE_DynamoDBTable_HashKey
  OM_USECASE_DynamoDBTable_AttributeType = var.OM_USECASE_DynamoDBTable_AttributeType
  common_tags                                  = var.common_tags

}

################################################################################################
# API_GATEWAY MODULE
################################################################################################

module "api_gateway_us-east-1" {
  source = "./modules/api_gateway"
  providers = {
    aws = aws.us-east-1

  }

  OM_USECASE_LambdaTokenAuthorizer_InvokeARN = module.lambda_package_us-east-1.OM_USECASE_LambdaTokenAuthorizer_InvokeARN
  OM_USECASE_LambdaFunction_GET_FunctionName = module.lambda_package_us-east-1.OM_USECASE_LambdaFunction_GET_FunctionName
  OM_USECASE_LambdaFunction_GET_ARN          = module.lambda_package_us-east-1.OM_USECASE_LambdaFunction_GET_ARN

  OM_USECASE_LambdaTokenAuthorizer_Name                           = var.OM_USECASE_LambdaTokenAuthorizer_Name
  OM_USECASE_LambdaTokenAuthorizer_Type                           = var.OM_USECASE_LambdaTokenAuthorizer_Type
  OM_USECASE_LambdaTokenAuthorizer_IdentitySource                 = var.OM_USECASE_LambdaTokenAuthorizer_IdentitySource
  OM_USECASE_APIGateway_Name                                      = var.OM_USECASE_APIGateway_Name
  OM_USECASE_APIGateway_Description                               = var.OM_USECASE_APIGateway_Description
  OM_USECASE_APIGateway_EndpointType                              = var.OM_USECASE_APIGateway_EndpointType
  OM_USECASE_APIGateway_Resource_PathPart                         = var.OM_USECASE_APIGateway_Resource_PathPart
  OM_USECASE_APIGateway_RequestValidator_Name                     = var.OM_USECASE_APIGateway_RequestValidator_Name
  OM_USECASE_APIGateway_RequestValidator_ValidateRequestBody      = var.OM_USECASE_APIGateway_RequestValidator_ValidateRequestBody
  OM_USECASE_APIGateway_HTTPMETHOD                                = var.OM_USECASE_APIGateway_HTTPMETHOD
  OM_USECASE_APIGateway_Method_Authorization                      = var.OM_USECASE_APIGateway_Method_Authorization
  OM_USECASE_APIGateway_Integration_TYPE                          = var.OM_USECASE_APIGateway_Integration_TYPE
  OM_USECASE_APIGateway_Integration_RequestTemplates              = var.OM_USECASE_APIGateway_Integration_RequestTemplates
  OM_USECASE_APIGateway_Integration_RequestParameters             = var.OM_USECASE_APIGateway_Integration_RequestParameters
  OM_USECASE_APIGateway_IntegrationResponse_Post_ResponseTemplate = var.OM_USECASE_APIGateway_IntegrationResponse_Post_ResponseTemplate
  OM_USECASE_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = var.OM_USECASE_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  OM_USECASE_APIGateway_MethodResponse_DELETE_ResponseTemplate    = var.OM_USECASE_APIGateway_MethodResponse_DELETE_ResponseTemplate
  OM_USECASE_APIGateway_MethodResponse_StatusCode                 = var.OM_USECASE_APIGateway_MethodResponse_StatusCode
  OM_USECASE_APIGateway_Method_PUT_HttpMethod                     = var.OM_USECASE_APIGateway_Method_PUT_HttpMethod
  OM_USECASE_APIGateway_Method_DELETE_HttpMethod                  = var.OM_USECASE_APIGateway_Method_DELETE_HttpMethod
  OM_USECASE_APIGateway_Invoke_GET_StatementID                    = var.OM_USECASE_APIGateway_Invoke_GET_StatementID
  OM_USECASE_APIGateway_Invoke_GET_Action                         = var.OM_USECASE_APIGateway_Invoke_GET_Action
  OM_USECASE_APIGateway_Invoke_GET_Principle                      = var.OM_USECASE_APIGateway_Invoke_GET_Principle
  OM_USECASE_Method_GET_HttpMethod                                = var.OM_USECASE_Method_GET_HttpMethod
  OM_USECASE_Integration_GET_Type                                 = var.OM_USECASE_Integration_GET_Type
  OM_USECASE_Integration_GET_ApplicationJson                      = var.OM_USECASE_Integration_GET_ApplicationJson
  OM_USECASE_MethodResponse_GET_ResponseModels                    = var.OM_USECASE_MethodResponse_GET_ResponseModels
  OM_USECASE_IntegrationResponse_GET_ResponseTemplate             = var.OM_USECASE_IntegrationResponse_GET_ResponseTemplate
  OM_USECASE_APIGatewayDeployment_StageName                       = var.OM_USECASE_APIGatewayDeployment_StageName
  arn_apigateway                                                        = var.arn_apigateway
  OM_USECASE_QueueSQS_path                                        = var.OM_USECASE_QueueSQS_path
  aws_account                                                           = var.aws_account
  common_tags                                                           = var.common_tags
   iam_role_arn             = module.iam.iam_role_arn

}

################################################################################################
# SQS MODULE
################################################################################################
module "sqs_us-east-1" {
  source = "./modules/sqs"
  providers = {
    aws = aws.us-east-1

  }

  OM_USECASE_APIGateway_Execution_ARN           = module.api_gateway_us-east-1.OM_USECASE_APIGateway_Execution_ARN
  OM_USECASE_QueueSQS_Name                      = var.OM_USECASE_QueueSQS_Name
  OM_USECASE_QueueSQS_DelaySeconds              = var.OM_USECASE_QueueSQS_DelaySeconds
  OM_USECASE_QueueSQS_MaxMessageSize            = var.OM_USECASE_QueueSQS_MaxMessageSize
  OM_USECASE_QueueSQS_MessageRetentionSeconds   = var.OM_USECASE_QueueSQS_MessageRetentionSeconds
  OM_USECASE_QueueSQS_VisisbilityTimeoutSeconds = var.OM_USECASE_QueueSQS_VisisbilityTimeoutSeconds
  OM_USECASE_QueueSQS_ReceiveWaitTimeSeconds    = var.OM_USECASE_QueueSQS_ReceiveWaitTimeSeconds
  OM_USECASE_QueueSQS_ARN                       = module.sqs_us-east-1.OM_USECASE_QueueSQS_ARN
  common_tags                                         = var.common_tags

}

################################################################################################
# LAMBDA_PACKAGE MODULE
################################################################################################
module "lambda_package_us-east-1" {
  source = "./modules/lambda_package"
  providers = {
    aws = aws.us-east-1

  }

  OM_USECASE_QueueSQS_ARN                                 = module.sqs_us-east-1.OM_USECASE_QueueSQS_ARN
  OM_USECASE_QueueSQS                                     = module.sqs_us-east-1.OM_USECASE_QueueSQS
  OM_USECASE_DynamoDBTable_Name                           = module.dynamo_db_us-east-1.OM_USECASE_DynamoDBTable_Name
  OM_USECASE_QueueSQS_URL                                 = module.sqs_us-east-1.OM_USECASE_QueueSQS_URL
  OM_USECASE_LambdaFunction_CRUD_FileName                 = var.OM_USECASE_LambdaFunction_CRUD_FileName
  OM_USECASE_LambdaFunction_CRUD_FunctionName             = var.OM_USECASE_LambdaFunction_CRUD_FunctionName
  OM_USECASE_LambdaFunction_CRUD_Handler                  = var.OM_USECASE_LambdaFunction_CRUD_Handler
  OM_USECASE_LambdaFunction_Runtime                       = var.OM_USECASE_LambdaFunction_Runtime
  OM_USECASE_LambdaFunction_GET_FileName                  = var.OM_USECASE_LambdaFunction_GET_FileName
  OM_USECASE_LambdaFunction_GET_FunctionName              = var.OM_USECASE_LambdaFunction_GET_FunctionName
  OM_USECASE_LambdaFunction_GET_Handler                   = var.OM_USECASE_LambdaFunction_GET_Handler
  OM_USECASE_LambdaTokenAuthorizer_FileName               = var.OM_USECASE_LambdaTokenAuthorizer_FileName
  OM_USECASE_LambdaTokenAuthorizer_FunctionName           = var.OM_USECASE_LambdaTokenAuthorizer_FunctionName
  OM_USECASE_LambdaTokenAuthorizer_Handler                = var.OM_USECASE_LambdaTokenAuthorizer_Handler
  OM_USECASE_LambdaTrigger_BatchSize                      = var.OM_USECASE_LambdaTrigger_BatchSize
  OM_USECASE_LambdaTrigger_MaximumBatchingWindowInSeconds = var.OM_USECASE_LambdaTrigger_MaximumBatchingWindowInSeconds
  OM_USECASE_LambdaFunction_CRUD_FileName_archives        = var.OM_USECASE_LambdaFunction_CRUD_FileName_archives
  OM_USECASE_LambdaFunction_GET_FileName_archives         = var.OM_USECASE_LambdaFunction_GET_FileName_archives
  OM_USECASE_LambdaTokenAuthorizer_FileName_archives      = var.OM_USECASE_LambdaTokenAuthorizer_FileName_archives
  OM_USECASE_LambdaFunction_CRUD_Archive                  = var.OM_USECASE_LambdaFunction_CRUD_Archive
  OM_USECASE_LambdaFunction_GET_Archive                   = var.OM_USECASE_LambdaFunction_GET_Archive
  OM_USECASE_LambdaTokenAuthorizer_Archive                = var.OM_USECASE_LambdaTokenAuthorizer_Archive
  common_tags                                                   = var.common_tags
   iam_role_arn             = module.iam.iam_role_arn
}


###############################################################################################
# us-west-1
###############################################################################################


################################################################################################
# DYNAMO_DB MODULE
################################################################################################
module "dynamo_db_us-west-1" {

  source = "./modules/dynamo_db"
  providers = {
    aws = aws.us-west-1

  }

  OM_USECASE_DynamoDBTable_Name          = var.OM_USECASE_DynamoDBTable_Name
  OM_USECASE_DynamoDBTable_BillingMode   = var.OM_USECASE_DynamoDBTable_BillingMode
  OM_USECASE_DynamoDBTable_HashKey       = var.OM_USECASE_DynamoDBTable_HashKey
  OM_USECASE_DynamoDBTable_AttributeType = var.OM_USECASE_DynamoDBTable_AttributeType
  common_tags                                  = var.common_tags

}

################################################################################################
# API_GATEWAY MODULE
################################################################################################

module "api_gateway_us-west-1" {
  source = "./modules/api_gateway"
  providers = {
    aws = aws.us-west-1

  }

  OM_USECASE_LambdaTokenAuthorizer_InvokeARN = module.lambda_package_us-west-1.OM_USECASE_LambdaTokenAuthorizer_InvokeARN
  OM_USECASE_LambdaFunction_GET_FunctionName = module.lambda_package_us-west-1.OM_USECASE_LambdaFunction_GET_FunctionName
  OM_USECASE_LambdaFunction_GET_ARN          = module.lambda_package_us-west-1.OM_USECASE_LambdaFunction_GET_ARN

  OM_USECASE_LambdaTokenAuthorizer_Name                           = var.OM_USECASE_LambdaTokenAuthorizer_Name
  OM_USECASE_LambdaTokenAuthorizer_Type                           = var.OM_USECASE_LambdaTokenAuthorizer_Type
  OM_USECASE_LambdaTokenAuthorizer_IdentitySource                 = var.OM_USECASE_LambdaTokenAuthorizer_IdentitySource
  OM_USECASE_APIGateway_Name                                      = var.OM_USECASE_APIGateway_Name
  OM_USECASE_APIGateway_Description                               = var.OM_USECASE_APIGateway_Description
  OM_USECASE_APIGateway_EndpointType                              = var.OM_USECASE_APIGateway_EndpointType
  OM_USECASE_APIGateway_Resource_PathPart                         = var.OM_USECASE_APIGateway_Resource_PathPart
  OM_USECASE_APIGateway_RequestValidator_Name                     = var.OM_USECASE_APIGateway_RequestValidator_Name
  OM_USECASE_APIGateway_RequestValidator_ValidateRequestBody      = var.OM_USECASE_APIGateway_RequestValidator_ValidateRequestBody
  OM_USECASE_APIGateway_HTTPMETHOD                                = var.OM_USECASE_APIGateway_HTTPMETHOD
  OM_USECASE_APIGateway_Method_Authorization                      = var.OM_USECASE_APIGateway_Method_Authorization
  OM_USECASE_APIGateway_Integration_TYPE                          = var.OM_USECASE_APIGateway_Integration_TYPE
  OM_USECASE_APIGateway_Integration_RequestTemplates              = var.OM_USECASE_APIGateway_Integration_RequestTemplates
  OM_USECASE_APIGateway_Integration_RequestParameters             = var.OM_USECASE_APIGateway_Integration_RequestParameters
  OM_USECASE_APIGateway_IntegrationResponse_Post_ResponseTemplate = var.OM_USECASE_APIGateway_IntegrationResponse_Post_ResponseTemplate
  OM_USECASE_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = var.OM_USECASE_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  OM_USECASE_APIGateway_MethodResponse_DELETE_ResponseTemplate    = var.OM_USECASE_APIGateway_MethodResponse_DELETE_ResponseTemplate
  OM_USECASE_APIGateway_MethodResponse_StatusCode                 = var.OM_USECASE_APIGateway_MethodResponse_StatusCode
  OM_USECASE_APIGateway_Method_PUT_HttpMethod                     = var.OM_USECASE_APIGateway_Method_PUT_HttpMethod
  OM_USECASE_APIGateway_Method_DELETE_HttpMethod                  = var.OM_USECASE_APIGateway_Method_DELETE_HttpMethod
  OM_USECASE_APIGateway_Invoke_GET_StatementID                    = var.OM_USECASE_APIGateway_Invoke_GET_StatementID
  OM_USECASE_APIGateway_Invoke_GET_Action                         = var.OM_USECASE_APIGateway_Invoke_GET_Action
  OM_USECASE_APIGateway_Invoke_GET_Principle                      = var.OM_USECASE_APIGateway_Invoke_GET_Principle
  OM_USECASE_Method_GET_HttpMethod                                = var.OM_USECASE_Method_GET_HttpMethod
  OM_USECASE_Integration_GET_Type                                 = var.OM_USECASE_Integration_GET_Type
  OM_USECASE_Integration_GET_ApplicationJson                      = var.OM_USECASE_Integration_GET_ApplicationJson
  OM_USECASE_MethodResponse_GET_ResponseModels                    = var.OM_USECASE_MethodResponse_GET_ResponseModels
  OM_USECASE_IntegrationResponse_GET_ResponseTemplate             = var.OM_USECASE_IntegrationResponse_GET_ResponseTemplate
  OM_USECASE_APIGatewayDeployment_StageName                       = var.OM_USECASE_APIGatewayDeployment_StageName
  arn_apigateway                                                        = var.arn_apigateway
  OM_USECASE_QueueSQS_path                                        = var.OM_USECASE_QueueSQS_path
  aws_account                                                           = var.aws_account
  common_tags                                                           = var.common_tags
   iam_role_arn             = module.iam.iam_role_arn
}

################################################################################################
# SQS MODULE
################################################################################################
module "sqs_us-west-1" {
  source = "./modules/sqs"
  providers = {
    aws = aws.us-west-1

  }

  OM_USECASE_APIGateway_Execution_ARN           = module.api_gateway_us-west-1.OM_USECASE_APIGateway_Execution_ARN
  OM_USECASE_QueueSQS_Name                      = var.OM_USECASE_QueueSQS_Name
  OM_USECASE_QueueSQS_DelaySeconds              = var.OM_USECASE_QueueSQS_DelaySeconds
  OM_USECASE_QueueSQS_MaxMessageSize            = var.OM_USECASE_QueueSQS_MaxMessageSize
  OM_USECASE_QueueSQS_MessageRetentionSeconds   = var.OM_USECASE_QueueSQS_MessageRetentionSeconds
  OM_USECASE_QueueSQS_VisisbilityTimeoutSeconds = var.OM_USECASE_QueueSQS_VisisbilityTimeoutSeconds
  OM_USECASE_QueueSQS_ReceiveWaitTimeSeconds    = var.OM_USECASE_QueueSQS_ReceiveWaitTimeSeconds
  OM_USECASE_QueueSQS_ARN                       = module.sqs_us-west-1.OM_USECASE_QueueSQS_ARN
  common_tags                                         = var.common_tags

}

################################################################################################
# LAMBDA_PACKAGE MODULE
################################################################################################
module "lambda_package_us-west-1" {
  source = "./modules/lambda_package"
  providers = {
    aws = aws.us-west-1

  }

  OM_USECASE_QueueSQS_ARN                                 = module.sqs_us-west-1.OM_USECASE_QueueSQS_ARN
  OM_USECASE_QueueSQS                                     = module.sqs_us-west-1.OM_USECASE_QueueSQS
  OM_USECASE_DynamoDBTable_Name                           = module.dynamo_db_us-west-1.OM_USECASE_DynamoDBTable_Name
  OM_USECASE_QueueSQS_URL                                 = module.sqs_us-west-1.OM_USECASE_QueueSQS_URL
  OM_USECASE_LambdaFunction_CRUD_FileName                 = var.OM_USECASE_LambdaFunction_CRUD_FileName
  OM_USECASE_LambdaFunction_CRUD_FunctionName             = var.OM_USECASE_LambdaFunction_CRUD_FunctionName
  OM_USECASE_LambdaFunction_CRUD_Handler                  = var.OM_USECASE_LambdaFunction_CRUD_Handler
  OM_USECASE_LambdaFunction_Runtime                       = var.OM_USECASE_LambdaFunction_Runtime
  OM_USECASE_LambdaFunction_GET_FileName                  = var.OM_USECASE_LambdaFunction_GET_FileName
  OM_USECASE_LambdaFunction_GET_FunctionName              = var.OM_USECASE_LambdaFunction_GET_FunctionName
  OM_USECASE_LambdaFunction_GET_Handler                   = var.OM_USECASE_LambdaFunction_GET_Handler
  OM_USECASE_LambdaTokenAuthorizer_FileName               = var.OM_USECASE_LambdaTokenAuthorizer_FileName
  OM_USECASE_LambdaTokenAuthorizer_FunctionName           = var.OM_USECASE_LambdaTokenAuthorizer_FunctionName
  OM_USECASE_LambdaTokenAuthorizer_Handler                = var.OM_USECASE_LambdaTokenAuthorizer_Handler
  OM_USECASE_LambdaTrigger_BatchSize                      = var.OM_USECASE_LambdaTrigger_BatchSize
  OM_USECASE_LambdaTrigger_MaximumBatchingWindowInSeconds = var.OM_USECASE_LambdaTrigger_MaximumBatchingWindowInSeconds

  OM_USECASE_LambdaFunction_CRUD_FileName_archives        = var.OM_USECASE_LambdaFunction_CRUD_FileName_archives
  OM_USECASE_LambdaFunction_GET_FileName_archives         = var.OM_USECASE_LambdaFunction_GET_FileName_archives
  OM_USECASE_LambdaTokenAuthorizer_FileName_archives      = var.OM_USECASE_LambdaTokenAuthorizer_FileName_archives
  OM_USECASE_LambdaFunction_CRUD_Archive                  = var.OM_USECASE_LambdaFunction_CRUD_Archive
  OM_USECASE_LambdaFunction_GET_Archive                   = var.OM_USECASE_LambdaFunction_GET_Archive
  OM_USECASE_LambdaTokenAuthorizer_Archive                = var.OM_USECASE_LambdaTokenAuthorizer_Archive
  common_tags                                                   = var.common_tags
   iam_role_arn             = module.iam.iam_role_arn
}
