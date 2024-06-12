################################################################################################
# PROVIDER
################################################################################################

variable "access_key" {}
variable "secret_key" {}
# variable "region" {}
variable "aws_account" {}
variable "common_tags" {}

################################################################################################
# IAM VARIABLES
################################################################################################

# variable "OM_USECASE_APIGatewayRole_Name" {}
# variable "api_gateway_role_policy" {}
# variable "OM_USECASE_APIGatewayPolicy_Name" {}
# variable "OM_USECASE_APIGatewayPolicy_Description" {}
# variable "api_gateway_policy" {}
# variable "OM_USECASE_APIGatewayPolicyAttachment_Name" {}
# variable "OM_USECASE_LambdaRoleForAuthorizer_Name" {}
# variable "lambda_role_policy" {}
# variable "OM_USECASE_LambdaFullAccess_Name" {}
# variable "OM_USECASE_LambdaFullAccess_PolicyARN" {}
# variable "OM_USECASE_APIGatewayCustomPolicy_Name" {}
# variable "OM_USECASE_APIGatewayCustomPolicy_Description" {}
# variable "api_gateway_custom_policy" {}
# variable "OM_USECASE_APIPolicyAttachment_Name" {}
# variable "OM_USECASE_LambdaRole_Name" {}
# variable "lambdarole" {}
# variable "OM_USECASE_LambdaDynamoDBPolicyAttachment_Name" {}
# variable "OM_USECASE_LambdaDynamoDBPolicyAttachment_PolicyARN" {}
# variable "OM_USECASE_LambdaSQSPolicy_Name" {}
# variable "OM_USECASE_LambdaSQSPolicy_Description" {}
# variable "lambda_sqs_policy" {}
# variable "OM_USECASE_CloudWatchPolicy_Name" {}
# variable "OM_USECASE_CloudWatchPolicy_Description" {}
# variable "cloudwatch_policy" {}
# variable "OM_USECASE_CloudWatchPolicyAttachment_Name" {}

#IAM
variable "policy_name" {}
variable "policy_description" {}
variable "role_name" {}
variable "policy_attachment" {}

# variable "iam_role_arn" {}

################################################################################################
# API_GATEWAY VARIABLES
################################################################################################

variable "OM_USECASE_LambdaTokenAuthorizer_Name" {}
variable "OM_USECASE_LambdaTokenAuthorizer_Type" {}
variable "OM_USECASE_LambdaTokenAuthorizer_IdentitySource" {}
variable "OM_USECASE_APIGateway_Name" {}
variable "OM_USECASE_APIGateway_Description" {}
variable "OM_USECASE_APIGateway_EndpointType" {}
variable "OM_USECASE_APIGateway_Resource_PathPart" {}
variable "OM_USECASE_APIGateway_RequestValidator_Name" {}
variable "OM_USECASE_APIGateway_RequestValidator_ValidateRequestBody" {}
variable "OM_USECASE_APIGateway_HTTPMETHOD" {}
variable "OM_USECASE_APIGateway_Method_Authorization" {}
variable "OM_USECASE_APIGateway_Integration_TYPE" {}
variable "OM_USECASE_APIGateway_Integration_RequestTemplates" {}
variable "OM_USECASE_APIGateway_Integration_RequestParameters" {}
variable "OM_USECASE_APIGateway_IntegrationResponse_Post_ResponseTemplate" {}
variable "OM_USECASE_APIGateway_IntegrationResponse_PUT_ResponseTemplate" {}
variable "OM_USECASE_APIGateway_MethodResponse_DELETE_ResponseTemplate" {}
variable "OM_USECASE_APIGateway_MethodResponse_StatusCode" {}
variable "OM_USECASE_APIGateway_Method_PUT_HttpMethod" {}
variable "OM_USECASE_APIGateway_Method_DELETE_HttpMethod" {}
variable "OM_USECASE_APIGateway_Invoke_GET_StatementID" {}
variable "OM_USECASE_APIGateway_Invoke_GET_Action" {}
variable "OM_USECASE_APIGateway_Invoke_GET_Principle" {}
variable "OM_USECASE_Method_GET_HttpMethod" {}
variable "OM_USECASE_Integration_GET_Type" {}
variable "OM_USECASE_Integration_GET_ApplicationJson" {}
variable "OM_USECASE_MethodResponse_GET_ResponseModels" {}
variable "OM_USECASE_IntegrationResponse_GET_ResponseTemplate" {}
variable "OM_USECASE_APIGatewayDeployment_StageName" {}

variable "arn_apigateway" {}
variable "OM_USECASE_QueueSQS_path" {}

################################################################################################
# DYNAMO_DB VARIABLES
################################################################################################

variable "OM_USECASE_DynamoDBTable_Name" {}
variable "OM_USECASE_DynamoDBTable_BillingMode" {}
variable "OM_USECASE_DynamoDBTable_HashKey" {}
variable "OM_USECASE_DynamoDBTable_AttributeType" {}

################################################################################################
# SQS_QUEUE VARIABLES
################################################################################################

variable "OM_USECASE_QueueSQS_Name" {}
variable "OM_USECASE_QueueSQS_DelaySeconds" {}
variable "OM_USECASE_QueueSQS_MaxMessageSize" {}
variable "OM_USECASE_QueueSQS_MessageRetentionSeconds" {}
variable "OM_USECASE_QueueSQS_VisisbilityTimeoutSeconds" {}
variable "OM_USECASE_QueueSQS_ReceiveWaitTimeSeconds" {}

################################################################################################
# LAMBDA_PACKAGE VARIABLES
################################################################################################

variable "OM_USECASE_LambdaFunction_CRUD_FileName" {}
variable "OM_USECASE_LambdaFunction_CRUD_FunctionName" {}
variable "OM_USECASE_LambdaFunction_CRUD_Handler" {}
variable "OM_USECASE_LambdaFunction_Runtime" {}
variable "OM_USECASE_LambdaFunction_GET_FileName" {}
variable "OM_USECASE_LambdaFunction_GET_FunctionName" {}
variable "OM_USECASE_LambdaFunction_GET_Handler" {}
variable "OM_USECASE_LambdaTokenAuthorizer_FileName" {}
variable "OM_USECASE_LambdaTokenAuthorizer_FunctionName" {}
variable "OM_USECASE_LambdaTokenAuthorizer_Handler" {}
variable "OM_USECASE_LambdaTrigger_BatchSize" {}
variable "OM_USECASE_LambdaTrigger_MaximumBatchingWindowInSeconds" {}

variable "OM_USECASE_LambdaFunction_CRUD_FileName_archives" {}
variable "OM_USECASE_LambdaFunction_GET_FileName_archives" {}
variable "OM_USECASE_LambdaTokenAuthorizer_FileName_archives" {}

variable "OM_USECASE_LambdaFunction_CRUD_Archive" {}
variable "OM_USECASE_LambdaFunction_GET_Archive" {}
variable "OM_USECASE_LambdaTokenAuthorizer_Archive" {}
