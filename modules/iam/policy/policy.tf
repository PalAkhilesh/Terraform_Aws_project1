resource "aws_iam_policy" "OM_USECASE_POLICY" {
  name = var.policy_name
  description = var.policy_description
  policy = file("${path.module}/policies/policy.json")
}
