# Create Lambda Function
data "archive_file" "lambda_zip_file" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = "${path.module}/lambda.zip"
}

resource "aws_iam_role" "lambda_role" {
  name               = var.lambda_role_name 
  assume_role_policy = var.lambda_assume_role_policy
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda-policy"
  role = aws_iam_role.lambda_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["sqs:SendMessage"],
        Effect   = "Allow",
        Resource = var.sqs_arn
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

# resource "aws_iam_role_policy_attachment" "lambda_exec_role_attachment" {
#   role       = aws_iam_role.lambda_role.name
#   policy_arn = var.lambda_policy_arn
# }

resource "aws_lambda_function" "lambda_function" {
  filename         = data.archive_file.lambda_zip_file.output_path
  function_name    = var.lambda_name
  description      = var.lambda_description
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "nodejs18.x"
  timeout          = 30
  source_code_hash = data.archive_file.lambda_zip_file.output_base64sha256
  layers           = [var.lambda_layer_arn]

  environment {
    variables = var.environment_variables
  }

  tags = var.tags
}