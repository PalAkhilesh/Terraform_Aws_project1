
################################################################################################
# ARCHIVE LAMBDA FUNCTION FILES
################################################################################################

data "archive_file" "OM_USECASE_LambdaFunction_CRUD_Archive" {
  type        = "zip"
  source_file = var.OM_USECASE_LambdaFunction_CRUD_FileName
  output_path = "${path.module}/${var.OM_USECASE_LambdaFunction_CRUD_Archive}"
}

data "archive_file" "OM_USECASE_LambdaFunction_GET_Archive" {
  type        = "zip"
  source_file = var.OM_USECASE_LambdaFunction_GET_FileName
  output_path = "${path.module}/${var.OM_USECASE_LambdaFunction_GET_Archive}"
}

data "archive_file" "OM_USECASE_LambdaTokenAuthorizer_Archive" {
  type        = "zip"
  source_file = var.OM_USECASE_LambdaTokenAuthorizer_FileName
  output_path = "${path.module}/${var.OM_USECASE_LambdaTokenAuthorizer_Archive}"
}

################################################################################################
# LAMBDA_FUNCTION_CRUD CREATION
################################################################################################

resource "aws_lambda_function" "OM_USECASE_LambdaFunction_CRUD" {
  filename      = data.archive_file.OM_USECASE_LambdaFunction_CRUD_Archive.output_path
  function_name = var.OM_USECASE_LambdaFunction_CRUD_FunctionName
  role          = var.iam_role_arn 
  handler       = var.OM_USECASE_LambdaFunction_CRUD_Handler
  runtime       = var.OM_USECASE_LambdaFunction_Runtime

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.OM_USECASE_DynamoDBTable_Name,
      SQS_QUEUE_URL       = var.OM_USECASE_QueueSQS_URL,
    }
  }
  tags = var.common_tags
}

################################################################################################
# LAMBDA_FUNCTION_GET CREATION
################################################################################################

resource "aws_lambda_function" "OM_USECASE_LambdaFunction_GET" {
  filename      = data.archive_file.OM_USECASE_LambdaFunction_GET_Archive.output_path
  function_name = var.OM_USECASE_LambdaFunction_GET_FunctionName
  role          = var.iam_role_arn 
  handler       = var.OM_USECASE_LambdaFunction_GET_Handler
  runtime       = var.OM_USECASE_LambdaFunction_Runtime
  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.OM_USECASE_DynamoDBTable_Name
    }
  }
  tags = var.common_tags
}

################################################################################################
# LAMBDA_FUNCTION_LAMBDA-AUTHORIZER CREATION
################################################################################################

resource "aws_lambda_function" "OM_USECASE_LambdaTokenAuthorizer" {
  filename      = data.archive_file.OM_USECASE_LambdaTokenAuthorizer_Archive.output_path
  function_name = var.OM_USECASE_LambdaTokenAuthorizer_FunctionName
  role          = var.iam_role_arn
  handler       = var.OM_USECASE_LambdaTokenAuthorizer_Handler
  runtime       = var.OM_USECASE_LambdaFunction_Runtime
  tags = var.common_tags
}

################################################################################################
# LAMBDA_EVENT_SOURCE_MAPPING CREATION
################################################################################################

resource "aws_lambda_event_source_mapping" "OM_USECASE_LambdaTrigger" {
  event_source_arn                   = var.OM_USECASE_QueueSQS_ARN
  function_name                      = aws_lambda_function.OM_USECASE_LambdaFunction_CRUD.function_name
  batch_size                         = var.OM_USECASE_LambdaTrigger_BatchSize
  maximum_batching_window_in_seconds = var.OM_USECASE_LambdaTrigger_MaximumBatchingWindowInSeconds
  depends_on                         = [var.OM_USECASE_QueueSQS]
}
