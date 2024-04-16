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

  HTC_POC_OP_618579_DynamoDBTable_Name          = var.HTC_POC_OP_618579_DynamoDBTable_Name
  HTC_POC_OP_618579_DynamoDBTable_BillingMode   = var.HTC_POC_OP_618579_DynamoDBTable_BillingMode
  HTC_POC_OP_618579_DynamoDBTable_HashKey       = var.HTC_POC_OP_618579_DynamoDBTable_HashKey
  HTC_POC_OP_618579_DynamoDBTable_AttributeType = var.HTC_POC_OP_618579_DynamoDBTable_AttributeType
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

  HTC_POC_OP_618579_LambdaTokenAuthorizer_InvokeARN = module.lambda_package_us-east-1.HTC_POC_OP_618579_LambdaTokenAuthorizer_InvokeARN
  HTC_POC_OP_618579_LambdaFunction_GET_FunctionName = module.lambda_package_us-east-1.HTC_POC_OP_618579_LambdaFunction_GET_FunctionName
  HTC_POC_OP_618579_LambdaFunction_GET_ARN          = module.lambda_package_us-east-1.HTC_POC_OP_618579_LambdaFunction_GET_ARN

  HTC_POC_OP_618579_LambdaTokenAuthorizer_Name                           = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_Name
  HTC_POC_OP_618579_LambdaTokenAuthorizer_Type                           = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_Type
  HTC_POC_OP_618579_LambdaTokenAuthorizer_IdentitySource                 = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_IdentitySource
  HTC_POC_OP_618579_APIGateway_Name                                      = var.HTC_POC_OP_618579_APIGateway_Name
  HTC_POC_OP_618579_APIGateway_Description                               = var.HTC_POC_OP_618579_APIGateway_Description
  HTC_POC_OP_618579_APIGateway_EndpointType                              = var.HTC_POC_OP_618579_APIGateway_EndpointType
  HTC_POC_OP_618579_APIGateway_Resource_PathPart                         = var.HTC_POC_OP_618579_APIGateway_Resource_PathPart
  HTC_POC_OP_618579_APIGateway_RequestValidator_Name                     = var.HTC_POC_OP_618579_APIGateway_RequestValidator_Name
  HTC_POC_OP_618579_APIGateway_RequestValidator_ValidateRequestBody      = var.HTC_POC_OP_618579_APIGateway_RequestValidator_ValidateRequestBody
  HTC_POC_OP_618579_APIGateway_HTTPMETHOD                                = var.HTC_POC_OP_618579_APIGateway_HTTPMETHOD
  HTC_POC_OP_618579_APIGateway_Method_Authorization                      = var.HTC_POC_OP_618579_APIGateway_Method_Authorization
  HTC_POC_OP_618579_APIGateway_Integration_TYPE                          = var.HTC_POC_OP_618579_APIGateway_Integration_TYPE
  HTC_POC_OP_618579_APIGateway_Integration_RequestTemplates              = var.HTC_POC_OP_618579_APIGateway_Integration_RequestTemplates
  HTC_POC_OP_618579_APIGateway_Integration_RequestParameters             = var.HTC_POC_OP_618579_APIGateway_Integration_RequestParameters
  HTC_POC_OP_618579_APIGateway_IntegrationResponse_Post_ResponseTemplate = var.HTC_POC_OP_618579_APIGateway_IntegrationResponse_Post_ResponseTemplate
  HTC_POC_OP_618579_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = var.HTC_POC_OP_618579_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  HTC_POC_OP_618579_APIGateway_MethodResponse_DELETE_ResponseTemplate    = var.HTC_POC_OP_618579_APIGateway_MethodResponse_DELETE_ResponseTemplate
  HTC_POC_OP_618579_APIGateway_MethodResponse_StatusCode                 = var.HTC_POC_OP_618579_APIGateway_MethodResponse_StatusCode
  HTC_POC_OP_618579_APIGateway_Method_PUT_HttpMethod                     = var.HTC_POC_OP_618579_APIGateway_Method_PUT_HttpMethod
  HTC_POC_OP_618579_APIGateway_Method_DELETE_HttpMethod                  = var.HTC_POC_OP_618579_APIGateway_Method_DELETE_HttpMethod
  HTC_POC_OP_618579_APIGateway_Invoke_GET_StatementID                    = var.HTC_POC_OP_618579_APIGateway_Invoke_GET_StatementID
  HTC_POC_OP_618579_APIGateway_Invoke_GET_Action                         = var.HTC_POC_OP_618579_APIGateway_Invoke_GET_Action
  HTC_POC_OP_618579_APIGateway_Invoke_GET_Principle                      = var.HTC_POC_OP_618579_APIGateway_Invoke_GET_Principle
  HTC_POC_OP_618579_Method_GET_HttpMethod                                = var.HTC_POC_OP_618579_Method_GET_HttpMethod
  HTC_POC_OP_618579_Integration_GET_Type                                 = var.HTC_POC_OP_618579_Integration_GET_Type
  HTC_POC_OP_618579_Integration_GET_ApplicationJson                      = var.HTC_POC_OP_618579_Integration_GET_ApplicationJson
  HTC_POC_OP_618579_MethodResponse_GET_ResponseModels                    = var.HTC_POC_OP_618579_MethodResponse_GET_ResponseModels
  HTC_POC_OP_618579_IntegrationResponse_GET_ResponseTemplate             = var.HTC_POC_OP_618579_IntegrationResponse_GET_ResponseTemplate
  HTC_POC_OP_618579_APIGatewayDeployment_StageName                       = var.HTC_POC_OP_618579_APIGatewayDeployment_StageName
  arn_apigateway                                                        = var.arn_apigateway
  HTC_POC_OP_618579_QueueSQS_path                                        = var.HTC_POC_OP_618579_QueueSQS_path
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

  HTC_POC_OP_618579_APIGateway_Execution_ARN           = module.api_gateway_us-east-1.HTC_POC_OP_618579_APIGateway_Execution_ARN
  HTC_POC_OP_618579_QueueSQS_Name                      = var.HTC_POC_OP_618579_QueueSQS_Name
  HTC_POC_OP_618579_QueueSQS_DelaySeconds              = var.HTC_POC_OP_618579_QueueSQS_DelaySeconds
  HTC_POC_OP_618579_QueueSQS_MaxMessageSize            = var.HTC_POC_OP_618579_QueueSQS_MaxMessageSize
  HTC_POC_OP_618579_QueueSQS_MessageRetentionSeconds   = var.HTC_POC_OP_618579_QueueSQS_MessageRetentionSeconds
  HTC_POC_OP_618579_QueueSQS_VisisbilityTimeoutSeconds = var.HTC_POC_OP_618579_QueueSQS_VisisbilityTimeoutSeconds
  HTC_POC_OP_618579_QueueSQS_ReceiveWaitTimeSeconds    = var.HTC_POC_OP_618579_QueueSQS_ReceiveWaitTimeSeconds
  HTC_POC_OP_618579_QueueSQS_ARN                       = module.sqs_us-east-1.HTC_POC_OP_618579_QueueSQS_ARN
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

  HTC_POC_OP_618579_QueueSQS_ARN                                 = module.sqs_us-east-1.HTC_POC_OP_618579_QueueSQS_ARN
  HTC_POC_OP_618579_QueueSQS                                     = module.sqs_us-east-1.HTC_POC_OP_618579_QueueSQS
  HTC_POC_OP_618579_DynamoDBTable_Name                           = module.dynamo_db_us-east-1.HTC_POC_OP_618579_DynamoDBTable_Name
  HTC_POC_OP_618579_QueueSQS_URL                                 = module.sqs_us-east-1.HTC_POC_OP_618579_QueueSQS_URL
  HTC_POC_OP_618579_LambdaFunction_CRUD_FileName                 = var.HTC_POC_OP_618579_LambdaFunction_CRUD_FileName
  HTC_POC_OP_618579_LambdaFunction_CRUD_FunctionName             = var.HTC_POC_OP_618579_LambdaFunction_CRUD_FunctionName
  HTC_POC_OP_618579_LambdaFunction_CRUD_Handler                  = var.HTC_POC_OP_618579_LambdaFunction_CRUD_Handler
  HTC_POC_OP_618579_LambdaFunction_Runtime                       = var.HTC_POC_OP_618579_LambdaFunction_Runtime
  HTC_POC_OP_618579_LambdaFunction_GET_FileName                  = var.HTC_POC_OP_618579_LambdaFunction_GET_FileName
  HTC_POC_OP_618579_LambdaFunction_GET_FunctionName              = var.HTC_POC_OP_618579_LambdaFunction_GET_FunctionName
  HTC_POC_OP_618579_LambdaFunction_GET_Handler                   = var.HTC_POC_OP_618579_LambdaFunction_GET_Handler
  HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName               = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName
  HTC_POC_OP_618579_LambdaTokenAuthorizer_FunctionName           = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_FunctionName
  HTC_POC_OP_618579_LambdaTokenAuthorizer_Handler                = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_Handler
  HTC_POC_OP_618579_LambdaTrigger_BatchSize                      = var.HTC_POC_OP_618579_LambdaTrigger_BatchSize
  HTC_POC_OP_618579_LambdaTrigger_MaximumBatchingWindowInSeconds = var.HTC_POC_OP_618579_LambdaTrigger_MaximumBatchingWindowInSeconds
  HTC_POC_OP_618579_LambdaFunction_CRUD_FileName_archives        = var.HTC_POC_OP_618579_LambdaFunction_CRUD_FileName_archives
  HTC_POC_OP_618579_LambdaFunction_GET_FileName_archives         = var.HTC_POC_OP_618579_LambdaFunction_GET_FileName_archives
  HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName_archives      = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName_archives
  HTC_POC_OP_618579_LambdaFunction_CRUD_Archive                  = var.HTC_POC_OP_618579_LambdaFunction_CRUD_Archive
  HTC_POC_OP_618579_LambdaFunction_GET_Archive                   = var.HTC_POC_OP_618579_LambdaFunction_GET_Archive
  HTC_POC_OP_618579_LambdaTokenAuthorizer_Archive                = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_Archive
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

  HTC_POC_OP_618579_DynamoDBTable_Name          = var.HTC_POC_OP_618579_DynamoDBTable_Name
  HTC_POC_OP_618579_DynamoDBTable_BillingMode   = var.HTC_POC_OP_618579_DynamoDBTable_BillingMode
  HTC_POC_OP_618579_DynamoDBTable_HashKey       = var.HTC_POC_OP_618579_DynamoDBTable_HashKey
  HTC_POC_OP_618579_DynamoDBTable_AttributeType = var.HTC_POC_OP_618579_DynamoDBTable_AttributeType
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

  HTC_POC_OP_618579_LambdaTokenAuthorizer_InvokeARN = module.lambda_package_us-west-1.HTC_POC_OP_618579_LambdaTokenAuthorizer_InvokeARN
  HTC_POC_OP_618579_LambdaFunction_GET_FunctionName = module.lambda_package_us-west-1.HTC_POC_OP_618579_LambdaFunction_GET_FunctionName
  HTC_POC_OP_618579_LambdaFunction_GET_ARN          = module.lambda_package_us-west-1.HTC_POC_OP_618579_LambdaFunction_GET_ARN

  HTC_POC_OP_618579_LambdaTokenAuthorizer_Name                           = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_Name
  HTC_POC_OP_618579_LambdaTokenAuthorizer_Type                           = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_Type
  HTC_POC_OP_618579_LambdaTokenAuthorizer_IdentitySource                 = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_IdentitySource
  HTC_POC_OP_618579_APIGateway_Name                                      = var.HTC_POC_OP_618579_APIGateway_Name
  HTC_POC_OP_618579_APIGateway_Description                               = var.HTC_POC_OP_618579_APIGateway_Description
  HTC_POC_OP_618579_APIGateway_EndpointType                              = var.HTC_POC_OP_618579_APIGateway_EndpointType
  HTC_POC_OP_618579_APIGateway_Resource_PathPart                         = var.HTC_POC_OP_618579_APIGateway_Resource_PathPart
  HTC_POC_OP_618579_APIGateway_RequestValidator_Name                     = var.HTC_POC_OP_618579_APIGateway_RequestValidator_Name
  HTC_POC_OP_618579_APIGateway_RequestValidator_ValidateRequestBody      = var.HTC_POC_OP_618579_APIGateway_RequestValidator_ValidateRequestBody
  HTC_POC_OP_618579_APIGateway_HTTPMETHOD                                = var.HTC_POC_OP_618579_APIGateway_HTTPMETHOD
  HTC_POC_OP_618579_APIGateway_Method_Authorization                      = var.HTC_POC_OP_618579_APIGateway_Method_Authorization
  HTC_POC_OP_618579_APIGateway_Integration_TYPE                          = var.HTC_POC_OP_618579_APIGateway_Integration_TYPE
  HTC_POC_OP_618579_APIGateway_Integration_RequestTemplates              = var.HTC_POC_OP_618579_APIGateway_Integration_RequestTemplates
  HTC_POC_OP_618579_APIGateway_Integration_RequestParameters             = var.HTC_POC_OP_618579_APIGateway_Integration_RequestParameters
  HTC_POC_OP_618579_APIGateway_IntegrationResponse_Post_ResponseTemplate = var.HTC_POC_OP_618579_APIGateway_IntegrationResponse_Post_ResponseTemplate
  HTC_POC_OP_618579_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = var.HTC_POC_OP_618579_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  HTC_POC_OP_618579_APIGateway_MethodResponse_DELETE_ResponseTemplate    = var.HTC_POC_OP_618579_APIGateway_MethodResponse_DELETE_ResponseTemplate
  HTC_POC_OP_618579_APIGateway_MethodResponse_StatusCode                 = var.HTC_POC_OP_618579_APIGateway_MethodResponse_StatusCode
  HTC_POC_OP_618579_APIGateway_Method_PUT_HttpMethod                     = var.HTC_POC_OP_618579_APIGateway_Method_PUT_HttpMethod
  HTC_POC_OP_618579_APIGateway_Method_DELETE_HttpMethod                  = var.HTC_POC_OP_618579_APIGateway_Method_DELETE_HttpMethod
  HTC_POC_OP_618579_APIGateway_Invoke_GET_StatementID                    = var.HTC_POC_OP_618579_APIGateway_Invoke_GET_StatementID
  HTC_POC_OP_618579_APIGateway_Invoke_GET_Action                         = var.HTC_POC_OP_618579_APIGateway_Invoke_GET_Action
  HTC_POC_OP_618579_APIGateway_Invoke_GET_Principle                      = var.HTC_POC_OP_618579_APIGateway_Invoke_GET_Principle
  HTC_POC_OP_618579_Method_GET_HttpMethod                                = var.HTC_POC_OP_618579_Method_GET_HttpMethod
  HTC_POC_OP_618579_Integration_GET_Type                                 = var.HTC_POC_OP_618579_Integration_GET_Type
  HTC_POC_OP_618579_Integration_GET_ApplicationJson                      = var.HTC_POC_OP_618579_Integration_GET_ApplicationJson
  HTC_POC_OP_618579_MethodResponse_GET_ResponseModels                    = var.HTC_POC_OP_618579_MethodResponse_GET_ResponseModels
  HTC_POC_OP_618579_IntegrationResponse_GET_ResponseTemplate             = var.HTC_POC_OP_618579_IntegrationResponse_GET_ResponseTemplate
  HTC_POC_OP_618579_APIGatewayDeployment_StageName                       = var.HTC_POC_OP_618579_APIGatewayDeployment_StageName
  arn_apigateway                                                        = var.arn_apigateway
  HTC_POC_OP_618579_QueueSQS_path                                        = var.HTC_POC_OP_618579_QueueSQS_path
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

  HTC_POC_OP_618579_APIGateway_Execution_ARN           = module.api_gateway_us-west-1.HTC_POC_OP_618579_APIGateway_Execution_ARN
  HTC_POC_OP_618579_QueueSQS_Name                      = var.HTC_POC_OP_618579_QueueSQS_Name
  HTC_POC_OP_618579_QueueSQS_DelaySeconds              = var.HTC_POC_OP_618579_QueueSQS_DelaySeconds
  HTC_POC_OP_618579_QueueSQS_MaxMessageSize            = var.HTC_POC_OP_618579_QueueSQS_MaxMessageSize
  HTC_POC_OP_618579_QueueSQS_MessageRetentionSeconds   = var.HTC_POC_OP_618579_QueueSQS_MessageRetentionSeconds
  HTC_POC_OP_618579_QueueSQS_VisisbilityTimeoutSeconds = var.HTC_POC_OP_618579_QueueSQS_VisisbilityTimeoutSeconds
  HTC_POC_OP_618579_QueueSQS_ReceiveWaitTimeSeconds    = var.HTC_POC_OP_618579_QueueSQS_ReceiveWaitTimeSeconds
  HTC_POC_OP_618579_QueueSQS_ARN                       = module.sqs_us-west-1.HTC_POC_OP_618579_QueueSQS_ARN
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

  HTC_POC_OP_618579_QueueSQS_ARN                                 = module.sqs_us-west-1.HTC_POC_OP_618579_QueueSQS_ARN
  HTC_POC_OP_618579_QueueSQS                                     = module.sqs_us-west-1.HTC_POC_OP_618579_QueueSQS
  HTC_POC_OP_618579_DynamoDBTable_Name                           = module.dynamo_db_us-west-1.HTC_POC_OP_618579_DynamoDBTable_Name
  HTC_POC_OP_618579_QueueSQS_URL                                 = module.sqs_us-west-1.HTC_POC_OP_618579_QueueSQS_URL
  HTC_POC_OP_618579_LambdaFunction_CRUD_FileName                 = var.HTC_POC_OP_618579_LambdaFunction_CRUD_FileName
  HTC_POC_OP_618579_LambdaFunction_CRUD_FunctionName             = var.HTC_POC_OP_618579_LambdaFunction_CRUD_FunctionName
  HTC_POC_OP_618579_LambdaFunction_CRUD_Handler                  = var.HTC_POC_OP_618579_LambdaFunction_CRUD_Handler
  HTC_POC_OP_618579_LambdaFunction_Runtime                       = var.HTC_POC_OP_618579_LambdaFunction_Runtime
  HTC_POC_OP_618579_LambdaFunction_GET_FileName                  = var.HTC_POC_OP_618579_LambdaFunction_GET_FileName
  HTC_POC_OP_618579_LambdaFunction_GET_FunctionName              = var.HTC_POC_OP_618579_LambdaFunction_GET_FunctionName
  HTC_POC_OP_618579_LambdaFunction_GET_Handler                   = var.HTC_POC_OP_618579_LambdaFunction_GET_Handler
  HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName               = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName
  HTC_POC_OP_618579_LambdaTokenAuthorizer_FunctionName           = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_FunctionName
  HTC_POC_OP_618579_LambdaTokenAuthorizer_Handler                = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_Handler
  HTC_POC_OP_618579_LambdaTrigger_BatchSize                      = var.HTC_POC_OP_618579_LambdaTrigger_BatchSize
  HTC_POC_OP_618579_LambdaTrigger_MaximumBatchingWindowInSeconds = var.HTC_POC_OP_618579_LambdaTrigger_MaximumBatchingWindowInSeconds

  HTC_POC_OP_618579_LambdaFunction_CRUD_FileName_archives        = var.HTC_POC_OP_618579_LambdaFunction_CRUD_FileName_archives
  HTC_POC_OP_618579_LambdaFunction_GET_FileName_archives         = var.HTC_POC_OP_618579_LambdaFunction_GET_FileName_archives
  HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName_archives      = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName_archives
  HTC_POC_OP_618579_LambdaFunction_CRUD_Archive                  = var.HTC_POC_OP_618579_LambdaFunction_CRUD_Archive
  HTC_POC_OP_618579_LambdaFunction_GET_Archive                   = var.HTC_POC_OP_618579_LambdaFunction_GET_Archive
  HTC_POC_OP_618579_LambdaTokenAuthorizer_Archive                = var.HTC_POC_OP_618579_LambdaTokenAuthorizer_Archive
  common_tags                                                   = var.common_tags
   iam_role_arn             = module.iam.iam_role_arn
}
