########################################          SQS_QUEUE-SECTION          ########################################

# resource "aws_sqs_queue" "OM_USECASE_ResponseQueue" {
#   name                       = "OM_USECASE_ResponseQueue"
#   delay_seconds              = 0
#   max_message_size           = 262144
#   message_retention_seconds  = 1209600 # 14 days
#   visibility_timeout_seconds = 10
#   receive_wait_time_seconds  = 0
# }

resource "aws_sqs_queue" "OM_USECASE_QueueSQS" {
  name                       = var.OM_USECASE_QueueSQS_Name
  delay_seconds              = var.OM_USECASE_QueueSQS_DelaySeconds
  max_message_size           = var.OM_USECASE_QueueSQS_MaxMessageSize
  message_retention_seconds  = var.OM_USECASE_QueueSQS_MessageRetentionSeconds
  visibility_timeout_seconds = var.OM_USECASE_QueueSQS_VisisbilityTimeoutSeconds
  receive_wait_time_seconds  = var.OM_USECASE_QueueSQS_ReceiveWaitTimeSeconds
  tags        = var.common_tags

#   redrive_policy = jsonencode({
#     deadLetterTargetArn = aws_sqs_queue.OM_USECASE_ResponseQueue.arn
#     maxReceiveCount     = 3
#   })
}