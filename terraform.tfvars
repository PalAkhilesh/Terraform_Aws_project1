################################################################################################
# PROVIDER
################################################################################################

# access_key  = provide your aws access key
# secret_key  =  provide your aws secert key 
# aws_account = your aws account id 
# provideraws = ">= 2.0"

common_tags = {
  Name    = "HTC_POC_ORDERPROCESSING_618579"
  Project = "ORDERPROCESSING"
  Owner   = "DINESH"
}

################################################################################################
# IAM TF_VARS
################################################################################################


policy_name = "HTC_POC_ORDER_PROCESSING_618579_POLICY"
policy_description = "grant access to DynamoDB, SQS, ApiGateway, CloudWatch,lambda "
role_name = "HTC_POC_ORDER_PROCESSING_618579_API_Lambda_Role"
policy_attachment = "attaching_polices_to_access_to_api_lambda"
# iam_role_arn   = "module.iam.iam_role_arn"

################################################################################################
# API_GATEWAY TF_VARS
################################################################################################

HTC_POC_OP_618579_LambdaTokenAuthorizer_Name                           = "HTC_POC_OP_618579_LambdaTokenAuthorizer"
HTC_POC_OP_618579_LambdaTokenAuthorizer_Type                           = "TOKEN"
HTC_POC_OP_618579_LambdaTokenAuthorizer_IdentitySource                 = "method.request.header.authorizationToken"
HTC_POC_OP_618579_APIGateway_Name                                      = "HTC_POC_OP_618579_APIGateway"
HTC_POC_OP_618579_APIGateway_Description                               = "REST API for HTC_POC_OP_618579_APIGateway"
HTC_POC_OP_618579_APIGateway_EndpointType                              = "REGIONAL"
HTC_POC_OP_618579_APIGateway_Resource_PathPart                         = "orders"
HTC_POC_OP_618579_APIGateway_RequestValidator_Name                     = "HTC_POC_OP_618579_APIGateway_RequestValidator"
HTC_POC_OP_618579_APIGateway_RequestValidator_ValidateRequestBody      = true
HTC_POC_OP_618579_APIGateway_HTTPMETHOD                                = "POST"
HTC_POC_OP_618579_APIGateway_Method_Authorization                      = "CUSTOM"
HTC_POC_OP_618579_APIGateway_Integration_TYPE                          = "AWS"
HTC_POC_OP_618579_APIGateway_Integration_RequestTemplates              = "Action=SendMessage&MessageBody=$input.body"
HTC_POC_OP_618579_APIGateway_Integration_RequestParameters             = "'application/x-www-form-urlencoded'"
HTC_POC_OP_618579_APIGateway_IntegrationResponse_Post_ResponseTemplate = "{\"message\": \"Post request is successfull!\"}"
HTC_POC_OP_618579_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = "{\"message\": \"PUT request is successfull!\"}"
HTC_POC_OP_618579_APIGateway_MethodResponse_DELETE_ResponseTemplate    = "{\"message\": \"DELETE request is successfull!\"}"
HTC_POC_OP_618579_APIGateway_MethodResponse_StatusCode                 = "200"
HTC_POC_OP_618579_APIGateway_Method_PUT_HttpMethod                     = "PUT"
HTC_POC_OP_618579_APIGateway_Method_DELETE_HttpMethod                  = "DELETE"
HTC_POC_OP_618579_APIGateway_Invoke_GET_StatementID                    = "HTC_POC_OP_618579_APIGateway_Invoke_GET"
HTC_POC_OP_618579_APIGateway_Invoke_GET_Action                         = "lambda:InvokeFunction"
HTC_POC_OP_618579_APIGateway_Invoke_GET_Principle                      = "apigateway.amazonaws.com"
HTC_POC_OP_618579_Method_GET_HttpMethod                                = "GET"
HTC_POC_OP_618579_Integration_GET_Type                                 = "AWS_PROXY"
HTC_POC_OP_618579_Integration_GET_ApplicationJson                      = "{\"statusCode\": 200}"
HTC_POC_OP_618579_MethodResponse_GET_ResponseModels                    = "Empty"
HTC_POC_OP_618579_IntegrationResponse_GET_ResponseTemplate             = ""
HTC_POC_OP_618579_APIGatewayDeployment_StageName                       = "prod"

arn_apigateway                 = "arn:aws:apigateway:"
HTC_POC_OP_618579_QueueSQS_path = ":sqs:path/631328934344/HTC_POC_OP_618579_QueueSQS"

################################################################################################
# DYNAMO_DB TF_VARS
################################################################################################

HTC_POC_OP_618579_DynamoDBTable_Name          = "HTC_POC_OP_618579_DynamoDBTable"
HTC_POC_OP_618579_DynamoDBTable_BillingMode   = "PAY_PER_REQUEST"
HTC_POC_OP_618579_DynamoDBTable_HashKey       = "order_id"
HTC_POC_OP_618579_DynamoDBTable_AttributeType = "N"

################################################################################################
# SQS_QUEUE TF_VARS
################################################################################################

HTC_POC_OP_618579_QueueSQS_Name                      = "HTC_POC_OP_618579_QueueSQS"
HTC_POC_OP_618579_QueueSQS_DelaySeconds              = 0
HTC_POC_OP_618579_QueueSQS_MaxMessageSize            = 262144
HTC_POC_OP_618579_QueueSQS_MessageRetentionSeconds   = 345600
HTC_POC_OP_618579_QueueSQS_VisisbilityTimeoutSeconds = 5
HTC_POC_OP_618579_QueueSQS_ReceiveWaitTimeSeconds    = 0

################################################################################################
# LAMBDA_PACKAGE TF_VARS
################################################################################################

HTC_POC_OP_618579_LambdaFunction_CRUD_FileName                 = "./modules/lambda_package/lambda_function_crud.py"
HTC_POC_OP_618579_LambdaFunction_CRUD_FunctionName             = "HTC_POC_OP_618579_LambdaFunction_CRUD"
HTC_POC_OP_618579_LambdaFunction_CRUD_Handler                  = "lambda_function_crud.lambda_handler"
HTC_POC_OP_618579_LambdaFunction_Runtime                       = "python3.8"
HTC_POC_OP_618579_LambdaFunction_GET_FileName                  = "./modules/lambda_package/lambda_function_get.py"
HTC_POC_OP_618579_LambdaFunction_GET_FunctionName              = "HTC_POC_OP_618579_LambdaFunction_GET"
HTC_POC_OP_618579_LambdaFunction_GET_Handler                   = "lambda_function_get.lambda_handler"
HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName               = "./modules/lambda_package/token_authorizer.py"
HTC_POC_OP_618579_LambdaTokenAuthorizer_FunctionName           = "HTC_POC_OP_618579_LambdaTokenAuthorizer"
HTC_POC_OP_618579_LambdaTokenAuthorizer_Handler                = "token_authorizer.lambda_handler"
HTC_POC_OP_618579_LambdaTrigger_BatchSize                      = 10
HTC_POC_OP_618579_LambdaTrigger_MaximumBatchingWindowInSeconds = 0

HTC_POC_OP_618579_LambdaFunction_CRUD_FileName_archives   = "./modules/lambda_package/archives/lambda_function_crud.zip"
HTC_POC_OP_618579_LambdaFunction_GET_FileName_archives    = "./modules/lambda_package/archives/lambda_function_get.zip"
HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName_archives = "./modules/lambda_package/archives/token_authorizer.zip"

HTC_POC_OP_618579_LambdaFunction_CRUD_Archive   = "/archives/lambda_function_crud.zip"
HTC_POC_OP_618579_LambdaFunction_GET_Archive    = "/archives/lambda_function_get.zip"
HTC_POC_OP_618579_LambdaTokenAuthorizer_Archive = "/archives/token_authorizer.zip"
