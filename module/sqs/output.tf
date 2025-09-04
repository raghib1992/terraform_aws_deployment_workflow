output "SQS_ARN" {
  description = "The ARN of the dead letter queue"
  value       = aws_sqs_queue.main_queue.arn
}

output "SQS_URL" {
  description = "The URL of the main SQS queue"
  value       = aws_sqs_queue.main_queue.url
}