resource "aws_iam_role" "OM_USECASE_LAMBDA_ROLE" {
  name = var.role_name
  assume_role_policy = var.assume_role
  
}
