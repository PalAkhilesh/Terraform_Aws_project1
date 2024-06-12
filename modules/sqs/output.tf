output "OM_USECASE_QueueSQS_ARN" {
  value = aws_sqs_queue.OM_USECASE_QueueSQS.arn
}

output "OM_USECASE_QueueSQS" {
  value = aws_sqs_queue.OM_USECASE_QueueSQS
}

output "OM_USECASE_QueueSQS_URL" {
  value = aws_sqs_queue.OM_USECASE_QueueSQS.id
}
output "OM_USECASE_QueueSQS_Name" {
  value = aws_sqs_queue.OM_USECASE_QueueSQS.name
}