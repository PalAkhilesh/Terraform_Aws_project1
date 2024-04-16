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

# variable "HTC_POC_OP_618579_APIGatewayRole_Name" {}
# variable "api_gateway_role_policy" {}
# variable "HTC_POC_OP_618579_APIGatewayPolicy_Name" {}
# variable "HTC_POC_OP_618579_APIGatewayPolicy_Description" {}
# variable "api_gateway_policy" {}
# variable "HTC_POC_OP_618579_APIGatewayPolicyAttachment_Name" {}
# variable "HTC_POC_OP_618579_LambdaRoleForAuthorizer_Name" {}
# variable "lambda_role_policy" {}
# variable "HTC_POC_OP_618579_LambdaFullAccess_Name" {}
# variable "HTC_POC_OP_618579_LambdaFullAccess_PolicyARN" {}
# variable "HTC_POC_OP_618579_APIGatewayCustomPolicy_Name" {}
# variable "HTC_POC_OP_618579_APIGatewayCustomPolicy_Description" {}
# variable "api_gateway_custom_policy" {}
# variable "HTC_POC_OP_618579_APIPolicyAttachment_Name" {}
# variable "HTC_POC_OP_618579_LambdaRole_Name" {}
# variable "lambdarole" {}
# variable "HTC_POC_OP_618579_LambdaDynamoDBPolicyAttachment_Name" {}
# variable "HTC_POC_OP_618579_LambdaDynamoDBPolicyAttachment_PolicyARN" {}
# variable "HTC_POC_OP_618579_LambdaSQSPolicy_Name" {}
# variable "HTC_POC_OP_618579_LambdaSQSPolicy_Description" {}
# variable "lambda_sqs_policy" {}
# variable "HTC_POC_OP_618579_CloudWatchPolicy_Name" {}
# variable "HTC_POC_OP_618579_CloudWatchPolicy_Description" {}
# variable "cloudwatch_policy" {}
# variable "HTC_POC_OP_618579_CloudWatchPolicyAttachment_Name" {}

#IAM
variable "policy_name" {}
variable "policy_description" {}
variable "role_name" {}
variable "policy_attachment" {}

# variable "iam_role_arn" {}

################################################################################################
# API_GATEWAY VARIABLES
################################################################################################

variable "HTC_POC_OP_618579_LambdaTokenAuthorizer_Name" {}
variable "HTC_POC_OP_618579_LambdaTokenAuthorizer_Type" {}
variable "HTC_POC_OP_618579_LambdaTokenAuthorizer_IdentitySource" {}
variable "HTC_POC_OP_618579_APIGateway_Name" {}
variable "HTC_POC_OP_618579_APIGateway_Description" {}
variable "HTC_POC_OP_618579_APIGateway_EndpointType" {}
variable "HTC_POC_OP_618579_APIGateway_Resource_PathPart" {}
variable "HTC_POC_OP_618579_APIGateway_RequestValidator_Name" {}
variable "HTC_POC_OP_618579_APIGateway_RequestValidator_ValidateRequestBody" {}
variable "HTC_POC_OP_618579_APIGateway_HTTPMETHOD" {}
variable "HTC_POC_OP_618579_APIGateway_Method_Authorization" {}
variable "HTC_POC_OP_618579_APIGateway_Integration_TYPE" {}
variable "HTC_POC_OP_618579_APIGateway_Integration_RequestTemplates" {}
variable "HTC_POC_OP_618579_APIGateway_Integration_RequestParameters" {}
variable "HTC_POC_OP_618579_APIGateway_IntegrationResponse_Post_ResponseTemplate" {}
variable "HTC_POC_OP_618579_APIGateway_IntegrationResponse_PUT_ResponseTemplate" {}
variable "HTC_POC_OP_618579_APIGateway_MethodResponse_DELETE_ResponseTemplate" {}
variable "HTC_POC_OP_618579_APIGateway_MethodResponse_StatusCode" {}
variable "HTC_POC_OP_618579_APIGateway_Method_PUT_HttpMethod" {}
variable "HTC_POC_OP_618579_APIGateway_Method_DELETE_HttpMethod" {}
variable "HTC_POC_OP_618579_APIGateway_Invoke_GET_StatementID" {}
variable "HTC_POC_OP_618579_APIGateway_Invoke_GET_Action" {}
variable "HTC_POC_OP_618579_APIGateway_Invoke_GET_Principle" {}
variable "HTC_POC_OP_618579_Method_GET_HttpMethod" {}
variable "HTC_POC_OP_618579_Integration_GET_Type" {}
variable "HTC_POC_OP_618579_Integration_GET_ApplicationJson" {}
variable "HTC_POC_OP_618579_MethodResponse_GET_ResponseModels" {}
variable "HTC_POC_OP_618579_IntegrationResponse_GET_ResponseTemplate" {}
variable "HTC_POC_OP_618579_APIGatewayDeployment_StageName" {}

variable "arn_apigateway" {}
variable "HTC_POC_OP_618579_QueueSQS_path" {}

################################################################################################
# DYNAMO_DB VARIABLES
################################################################################################

variable "HTC_POC_OP_618579_DynamoDBTable_Name" {}
variable "HTC_POC_OP_618579_DynamoDBTable_BillingMode" {}
variable "HTC_POC_OP_618579_DynamoDBTable_HashKey" {}
variable "HTC_POC_OP_618579_DynamoDBTable_AttributeType" {}

################################################################################################
# SQS_QUEUE VARIABLES
################################################################################################

variable "HTC_POC_OP_618579_QueueSQS_Name" {}
variable "HTC_POC_OP_618579_QueueSQS_DelaySeconds" {}
variable "HTC_POC_OP_618579_QueueSQS_MaxMessageSize" {}
variable "HTC_POC_OP_618579_QueueSQS_MessageRetentionSeconds" {}
variable "HTC_POC_OP_618579_QueueSQS_VisisbilityTimeoutSeconds" {}
variable "HTC_POC_OP_618579_QueueSQS_ReceiveWaitTimeSeconds" {}

################################################################################################
# LAMBDA_PACKAGE VARIABLES
################################################################################################

variable "HTC_POC_OP_618579_LambdaFunction_CRUD_FileName" {}
variable "HTC_POC_OP_618579_LambdaFunction_CRUD_FunctionName" {}
variable "HTC_POC_OP_618579_LambdaFunction_CRUD_Handler" {}
variable "HTC_POC_OP_618579_LambdaFunction_Runtime" {}
variable "HTC_POC_OP_618579_LambdaFunction_GET_FileName" {}
variable "HTC_POC_OP_618579_LambdaFunction_GET_FunctionName" {}
variable "HTC_POC_OP_618579_LambdaFunction_GET_Handler" {}
variable "HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName" {}
variable "HTC_POC_OP_618579_LambdaTokenAuthorizer_FunctionName" {}
variable "HTC_POC_OP_618579_LambdaTokenAuthorizer_Handler" {}
variable "HTC_POC_OP_618579_LambdaTrigger_BatchSize" {}
variable "HTC_POC_OP_618579_LambdaTrigger_MaximumBatchingWindowInSeconds" {}

variable "HTC_POC_OP_618579_LambdaFunction_CRUD_FileName_archives" {}
variable "HTC_POC_OP_618579_LambdaFunction_GET_FileName_archives" {}
variable "HTC_POC_OP_618579_LambdaTokenAuthorizer_FileName_archives" {}

variable "HTC_POC_OP_618579_LambdaFunction_CRUD_Archive" {}
variable "HTC_POC_OP_618579_LambdaFunction_GET_Archive" {}
variable "HTC_POC_OP_618579_LambdaTokenAuthorizer_Archive" {}
