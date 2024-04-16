data "aws_iam_policy_document" "HTC_POC_OP_618579_ASSUME_ROLE" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com", "lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
