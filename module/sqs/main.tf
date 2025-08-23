locals {
  sqs_name = var.sqs_name 
  dlq_name = var.dlq_name
  final_sqs_name = "${local.sqs_name}-${var.environment}"
  final_dlq_name = "${local.dlq_name}-${var.environment}"
}

# SQS Dead Letter Queue
resource "aws_sqs_queue" "dlq" {
  name = local.final_dlq_name
}

# Main SQS Queue with Redrive Policy
resource "aws_sqs_queue" "main_queue" {
  name = local.final_sqs_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 3
  })

  tags = var.tags
}