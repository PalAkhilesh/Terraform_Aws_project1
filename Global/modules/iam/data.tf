data "aws_iam_policy_document" "OM_USECASE_ASSUME_ROLE" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com", "lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
