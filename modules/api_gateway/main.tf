################################################################################################
# LAMBDA_AUTHORIZER CREATION
################################################################################################

resource "aws_api_gateway_authorizer" "OM_USECASE_LambdaTokenAuthorizer" {
  name                   = var.OM_USECASE_LambdaTokenAuthorizer_Name
  rest_api_id            = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  type                   = var.OM_USECASE_LambdaTokenAuthorizer_Type
  authorizer_uri         = var.OM_USECASE_LambdaTokenAuthorizer_InvokeARN
  identity_source        = var.OM_USECASE_LambdaTokenAuthorizer_IdentitySource
  authorizer_credentials = var.iam_role_arn
}

################################################################################################
# API_GATEWAY CREATION
################################################################################################

resource "aws_api_gateway_rest_api" "OM_USECASE_APIGateway" {
  name        = var.OM_USECASE_APIGateway_Name
  description = var.OM_USECASE_APIGateway_Description
  endpoint_configuration {
    types = [var.OM_USECASE_APIGateway_EndpointType]
  }
  tags = var.common_tags
}

################################################################################################
# API_GATEWAY RESOURCE & REQUEST VALIDATOR
################################################################################################

resource "aws_api_gateway_resource" "OM_USECASE_APIGateway_Resource" {
  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  parent_id   = aws_api_gateway_rest_api.OM_USECASE_APIGateway.root_resource_id
  path_part   = var.OM_USECASE_APIGateway_Resource_PathPart
}

resource "aws_api_gateway_request_validator" "OM_USECASE_APIGateway_RequestValidator" {
  rest_api_id           = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  name                  = var.OM_USECASE_APIGateway_RequestValidator_Name
  validate_request_body = var.OM_USECASE_APIGateway_RequestValidator_ValidateRequestBody
}

################################################################################################
# API_GATEWAY POST_METHOD
################################################################################################

resource "aws_api_gateway_method" "OM_USECASE_APIGateway_Method_POST" {
  rest_api_id   = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id   = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method   = var.OM_USECASE_APIGateway_HTTPMETHOD
  authorization = var.OM_USECASE_APIGateway_Method_Authorization
  authorizer_id = aws_api_gateway_authorizer.OM_USECASE_LambdaTokenAuthorizer.id

}

################################################################################################
# API_GATEWAY POST_INTEGRATION
################################################################################################

data "aws_region" "current" {}

resource "aws_api_gateway_integration" "OM_USECASE_APIGateway_Integration_POST" {
  rest_api_id             = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id             = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method             = aws_api_gateway_method.OM_USECASE_APIGateway_Method_POST.http_method
  type                    = var.OM_USECASE_APIGateway_Integration_TYPE
  uri                     = "${var.arn_apigateway}${data.aws_region.current.name}${var.OM_USECASE_QueueSQS_path}"
  integration_http_method = var.OM_USECASE_APIGateway_HTTPMETHOD
  credentials             = var.iam_role_arn
  request_templates = {
    "application/json" = var.OM_USECASE_APIGateway_Integration_RequestTemplates
  }

  request_parameters = {
    "integration.request.header.Content-Type" = var.OM_USECASE_APIGateway_Integration_RequestParameters
  }
}

################################################################################################
# API_GATEWAY POST_METHOD_RESPONSE
################################################################################################

resource "aws_api_gateway_method_response" "OM_USECASE_APIGateway_MethodResponse_POST" {
  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = aws_api_gateway_method.OM_USECASE_APIGateway_Method_POST.http_method
  status_code = var.OM_USECASE_APIGateway_MethodResponse_StatusCode
}

################################################################################################
# API_GATEWAY POST_INTEGRATION_RESPONSE
################################################################################################

resource "aws_api_gateway_integration_response" "OM_USECASE_APIGateway_IntegrationResponse_Post" {
  depends_on = [aws_api_gateway_integration.OM_USECASE_APIGateway_Integration_POST]

  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = aws_api_gateway_method.OM_USECASE_APIGateway_Method_POST.http_method
  status_code = var.OM_USECASE_APIGateway_MethodResponse_StatusCode

  response_templates = {
    "application/json" = var.OM_USECASE_APIGateway_IntegrationResponse_Post_ResponseTemplate
  }
}

################################################################################################
# API_GATEWAY PUT_METHOD
################################################################################################

resource "aws_api_gateway_method" "OM_USECASE_APIGateway_Method_PUT" {
  rest_api_id   = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id   = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method   = var.OM_USECASE_APIGateway_Method_PUT_HttpMethod
  authorization = var.OM_USECASE_APIGateway_Method_Authorization
  authorizer_id = aws_api_gateway_authorizer.OM_USECASE_LambdaTokenAuthorizer.id
}

################################################################################################
# API_GATEWAY PUT_INTEGRATION
################################################################################################

resource "aws_api_gateway_integration" "OM_USECASE_APIGateway_Integration_PUT" {
  rest_api_id             = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id             = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method             = aws_api_gateway_method.OM_USECASE_APIGateway_Method_PUT.http_method
  type                    = var.OM_USECASE_APIGateway_Integration_TYPE
  uri                     = "${var.arn_apigateway}${data.aws_region.current.name}${var.OM_USECASE_QueueSQS_path}"
  integration_http_method = var.OM_USECASE_APIGateway_HTTPMETHOD
  credentials             = var.iam_role_arn
  request_templates = {
    "application/json" = var.OM_USECASE_APIGateway_Integration_RequestTemplates
  }

  request_parameters = {
    "integration.request.header.Content-Type" = var.OM_USECASE_APIGateway_Integration_RequestParameters
  }
}

################################################################################################
# API_GATEWAY PUT_METHOD_RESPONSE
################################################################################################

resource "aws_api_gateway_method_response" "OM_USECASE_APIGateway_MethodResponse_PUT" {
  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = aws_api_gateway_method.OM_USECASE_APIGateway_Method_PUT.http_method
  status_code = var.OM_USECASE_APIGateway_MethodResponse_StatusCode
}

################################################################################################
# API_GATEWAY PUT_INTEGRATION_RESPONSE
################################################################################################

resource "aws_api_gateway_integration_response" "OM_USECASE_APIGateway_IntegrationResponse_PUT" {
  depends_on = [aws_api_gateway_integration.OM_USECASE_APIGateway_Integration_PUT]

  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = aws_api_gateway_method.OM_USECASE_APIGateway_Method_PUT.http_method
  status_code = aws_api_gateway_method_response.OM_USECASE_APIGateway_MethodResponse_PUT.status_code

  response_templates = {
    "application/json" = var.OM_USECASE_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  }
}

################################################################################################
# API_GATEWAY DELETE_METHOD
################################################################################################

resource "aws_api_gateway_method" "OM_USECASE_APIGateway_Method_DELETE" {
  rest_api_id   = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id   = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method   = var.OM_USECASE_APIGateway_Method_DELETE_HttpMethod
  authorization = var.OM_USECASE_APIGateway_Method_Authorization
  authorizer_id = aws_api_gateway_authorizer.OM_USECASE_LambdaTokenAuthorizer.id
}

################################################################################################
# API_GATEWAY DELETE_INTEGRATION
################################################################################################

resource "aws_api_gateway_integration" "OM_USECASE_APIGateway_Integration_DELETE" {
  rest_api_id             = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id             = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method             = aws_api_gateway_method.OM_USECASE_APIGateway_Method_DELETE.http_method
  type                    = var.OM_USECASE_APIGateway_Integration_TYPE
  uri                     = "${var.arn_apigateway}${data.aws_region.current.name}${var.OM_USECASE_QueueSQS_path}"
  integration_http_method = var.OM_USECASE_APIGateway_HTTPMETHOD
  credentials             = var.iam_role_arn
  request_templates = {
    "application/json" = var.OM_USECASE_APIGateway_Integration_RequestTemplates
  }

  request_parameters = {
    "integration.request.header.Content-Type" = var.OM_USECASE_APIGateway_Integration_RequestParameters
  }
}

################################################################################################
# API_GATEWAY DELETE_METHOD_RESPONSE
################################################################################################

resource "aws_api_gateway_method_response" "OM_USECASE_APIGateway_MethodResponse_DELETE" {
  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = aws_api_gateway_method.OM_USECASE_APIGateway_Method_DELETE.http_method
  status_code = var.OM_USECASE_APIGateway_MethodResponse_StatusCode
}

################################################################################################
# API_GATEWAY DELETE_INTEGRATION_RESPONSE
################################################################################################

resource "aws_api_gateway_integration_response" "OM_USECASE_APIGateway_IntegrationResponse_DELETE" {
  depends_on = [aws_api_gateway_integration.OM_USECASE_APIGateway_Integration_DELETE]

  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = aws_api_gateway_method.OM_USECASE_APIGateway_Method_DELETE.http_method
  status_code = aws_api_gateway_method_response.OM_USECASE_APIGateway_MethodResponse_DELETE.status_code

  response_templates = {
    "application/json" = var.OM_USECASE_APIGateway_MethodResponse_DELETE_ResponseTemplate
  }
}

################################################################################################
# API_GATEWAY TO INVOKE GET_LAMBDA_FUNCTION
################################################################################################

resource "aws_lambda_permission" "OM_USECASE_APIGateway_Invoke_GET" {
  statement_id  = var.OM_USECASE_APIGateway_Invoke_GET_StatementID
  action        = var.OM_USECASE_APIGateway_Invoke_GET_Action
  function_name = var.OM_USECASE_LambdaFunction_GET_FunctionName
  principal     = var.OM_USECASE_APIGateway_Invoke_GET_Principle
  source_arn    = "arn:aws:execute-api:${data.aws_region.current.name}:${var.aws_account}:${aws_api_gateway_rest_api.OM_USECASE_APIGateway.id}/*/GET/orders"
}

################################################################################################
# API_GATEWAY GET_METHOD
################################################################################################

resource "aws_api_gateway_method" "OM_USECASE_Method_GET" {
  rest_api_id   = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id   = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method   = var.OM_USECASE_Method_GET_HttpMethod
  authorization = var.OM_USECASE_APIGateway_Method_Authorization
  authorizer_id = aws_api_gateway_authorizer.OM_USECASE_LambdaTokenAuthorizer.id
}

################################################################################################
# API_GATEWAY GET_INTEGRATION
################################################################################################

resource "aws_api_gateway_integration" "OM_USECASE_Integration_GET" {
  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = aws_api_gateway_method.OM_USECASE_Method_GET.http_method

  integration_http_method = var.OM_USECASE_APIGateway_HTTPMETHOD
  type                    = var.OM_USECASE_Integration_GET_Type
  uri                     = "arn:aws:apigateway:${data.aws_region.current.name}:lambda:path/2015-03-31/functions/${var.OM_USECASE_LambdaFunction_GET_ARN}/invocations"
  request_templates = {
    "application/json" = var.OM_USECASE_Integration_GET_ApplicationJson
  }
  depends_on = [
    aws_api_gateway_method.OM_USECASE_Method_GET
  ]
}

################################################################################################
# API_GATEWAY GET_METHOD_RESPONSE
################################################################################################

resource "aws_api_gateway_method_response" "OM_USECASE_MethodResponse_GET" {
  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = aws_api_gateway_method.OM_USECASE_Method_GET.http_method
  status_code = var.OM_USECASE_APIGateway_MethodResponse_StatusCode
  response_models = {
    "application/json" = var.OM_USECASE_MethodResponse_GET_ResponseModels
  }
  depends_on = [
    aws_api_gateway_integration.OM_USECASE_Integration_GET
  ]
}

################################################################################################
# API_GATEWAY GET_INTEGRATION_RESPONSE
################################################################################################

resource "aws_api_gateway_integration_response" "OM_USECASE_IntegrationResponse_GET" {
  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  resource_id = aws_api_gateway_resource.OM_USECASE_APIGateway_Resource.id
  http_method = var.OM_USECASE_Method_GET_HttpMethod
  status_code = var.OM_USECASE_APIGateway_MethodResponse_StatusCode
  response_templates = {
    "application/json" = var.OM_USECASE_IntegrationResponse_GET_ResponseTemplate
  }
  depends_on = [
    aws_api_gateway_method_response.OM_USECASE_MethodResponse_GET
  ]
}

################################################################################################
# API_GATEWAY DEPLOYEMENT
################################################################################################

resource "aws_api_gateway_deployment" "OM_USECASE_APIGatewayDeployment" {
  depends_on = [aws_api_gateway_integration.OM_USECASE_APIGateway_Integration_POST,
    aws_api_gateway_integration.OM_USECASE_APIGateway_Integration_PUT,
    aws_api_gateway_integration.OM_USECASE_APIGateway_Integration_DELETE,
    aws_api_gateway_integration.OM_USECASE_Integration_GET
  ]
  rest_api_id = aws_api_gateway_rest_api.OM_USECASE_APIGateway.id
  stage_name  = var.OM_USECASE_APIGatewayDeployment_StageName
}
