################################################################################################
# PROVIDER
################################################################################################

# access_key  = provide your aws access key
# secret_key  =  provide your aws secert key 
# aws_account = your aws account id 
# provideraws = ">= 2.0"

common_tags = {
  Name    = "ORDER_MANAGEMENT_USECASE"
  Project = "ORDERPROCESSING"
  Owner   = "DINESH"
}

################################################################################################
# IAM TF_VARS
################################################################################################


policy_name = "OM_USECASE_POLICY"
policy_description = "grant access to DynamoDB, SQS, ApiGateway, CloudWatch,lambda "
role_name = "OM_USECASE_API_Lambda_Role"
policy_attachment = "attaching_polices_to_access_to_api_lambda"
# iam_role_arn   = "module.iam.iam_role_arn"

################################################################################################
# API_GATEWAY TF_VARS
################################################################################################

OM_USECASE_LambdaTokenAuthorizer_Name                           = "OM_USECASE_LambdaTokenAuthorizer"
OM_USECASE_LambdaTokenAuthorizer_Type                           = "TOKEN"
OM_USECASE_LambdaTokenAuthorizer_IdentitySource                 = "method.request.header.authorizationToken"
OM_USECASE_APIGateway_Name                                      = "OM_USECASE_APIGateway"
OM_USECASE_APIGateway_Description                               = "REST API for OM_USECASE_APIGateway"
OM_USECASE_APIGateway_EndpointType                              = "REGIONAL"
OM_USECASE_APIGateway_Resource_PathPart                         = "orders"
OM_USECASE_APIGateway_RequestValidator_Name                     = "OM_USECASE_APIGateway_RequestValidator"
OM_USECASE_APIGateway_RequestValidator_ValidateRequestBody      = true
OM_USECASE_APIGateway_HTTPMETHOD                                = "POST"
OM_USECASE_APIGateway_Method_Authorization                      = "CUSTOM"
OM_USECASE_APIGateway_Integration_TYPE                          = "AWS"
OM_USECASE_APIGateway_Integration_RequestTemplates              = "Action=SendMessage&MessageBody=$input.body"
OM_USECASE_APIGateway_Integration_RequestParameters             = "'application/x-www-form-urlencoded'"
OM_USECASE_APIGateway_IntegrationResponse_Post_ResponseTemplate = "{\"message\": \"Post request is successfull!\"}"
OM_USECASE_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = "{\"message\": \"PUT request is successfull!\"}"
OM_USECASE_APIGateway_MethodResponse_DELETE_ResponseTemplate    = "{\"message\": \"DELETE request is successfull!\"}"
OM_USECASE_APIGateway_MethodResponse_StatusCode                 = "200"
OM_USECASE_APIGateway_Method_PUT_HttpMethod                     = "PUT"
OM_USECASE_APIGateway_Method_DELETE_HttpMethod                  = "DELETE"
OM_USECASE_APIGateway_Invoke_GET_StatementID                    = "OM_USECASE_APIGateway_Invoke_GET"
OM_USECASE_APIGateway_Invoke_GET_Action                         = "lambda:InvokeFunction"
OM_USECASE_APIGateway_Invoke_GET_Principle                      = "apigateway.amazonaws.com"
OM_USECASE_Method_GET_HttpMethod                                = "GET"
OM_USECASE_Integration_GET_Type                                 = "AWS_PROXY"
OM_USECASE_Integration_GET_ApplicationJson                      = "{\"statusCode\": 200}"
OM_USECASE_MethodResponse_GET_ResponseModels                    = "Empty"
OM_USECASE_IntegrationResponse_GET_ResponseTemplate             = ""
OM_USECASE_APIGatewayDeployment_StageName                       = "prod"

arn_apigateway                 = "arn:aws:apigateway:"
OM_USECASE_QueueSQS_path = ":sqs:path/your_aws_id/OM_USECASE_QueueSQS"

################################################################################################
# DYNAMO_DB TF_VARS
################################################################################################

OM_USECASE_DynamoDBTable_Name          = "OM_USECASE_DynamoDBTable"
OM_USECASE_DynamoDBTable_BillingMode   = "PAY_PER_REQUEST"
OM_USECASE_DynamoDBTable_HashKey       = "order_id"
OM_USECASE_DynamoDBTable_AttributeType = "N"

################################################################################################
# SQS_QUEUE TF_VARS
################################################################################################

OM_USECASE_QueueSQS_Name                      = "OM_USECASE_QueueSQS"
OM_USECASE_QueueSQS_DelaySeconds              = 0
OM_USECASE_QueueSQS_MaxMessageSize            = 262144
OM_USECASE_QueueSQS_MessageRetentionSeconds   = 345600
OM_USECASE_QueueSQS_VisisbilityTimeoutSeconds = 5
OM_USECASE_QueueSQS_ReceiveWaitTimeSeconds    = 0

################################################################################################
# LAMBDA_PACKAGE TF_VARS
################################################################################################

OM_USECASE_LambdaFunction_CRUD_FileName                 = "./modules/lambda_package/lambda_function_crud.py"
OM_USECASE_LambdaFunction_CRUD_FunctionName             = "OM_USECASE_LambdaFunction_CRUD"
OM_USECASE_LambdaFunction_CRUD_Handler                  = "lambda_function_crud.lambda_handler"
OM_USECASE_LambdaFunction_Runtime                       = "python3.8"
OM_USECASE_LambdaFunction_GET_FileName                  = "./modules/lambda_package/lambda_function_get.py"
OM_USECASE_LambdaFunction_GET_FunctionName              = "OM_USECASE_LambdaFunction_GET"
OM_USECASE_LambdaFunction_GET_Handler                   = "lambda_function_get.lambda_handler"
OM_USECASE_LambdaTokenAuthorizer_FileName               = "./modules/lambda_package/token_authorizer.py"
OM_USECASE_LambdaTokenAuthorizer_FunctionName           = "OM_USECASE_LambdaTokenAuthorizer"
OM_USECASE_LambdaTokenAuthorizer_Handler                = "token_authorizer.lambda_handler"
OM_USECASE_LambdaTrigger_BatchSize                      = 10
OM_USECASE_LambdaTrigger_MaximumBatchingWindowInSeconds = 0

OM_USECASE_LambdaFunction_CRUD_FileName_archives   = "./modules/lambda_package/archives/lambda_function_crud.zip"
OM_USECASE_LambdaFunction_GET_FileName_archives    = "./modules/lambda_package/archives/lambda_function_get.zip"
OM_USECASE_LambdaTokenAuthorizer_FileName_archives = "./modules/lambda_package/archives/token_authorizer.zip"

OM_USECASE_LambdaFunction_CRUD_Archive   = "/archives/lambda_function_crud.zip"
OM_USECASE_LambdaFunction_GET_Archive    = "/archives/lambda_function_get.zip"
OM_USECASE_LambdaTokenAuthorizer_Archive = "/archives/token_authorizer.zip"
