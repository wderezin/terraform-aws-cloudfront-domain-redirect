
data archive_file lambdazip {
  type        = "zip"
  output_path = "${path.module}/lambda_function.zip"
  source_dir  = "${path.module}/lambda"
}

resource aws_lambda_function lambda {
  function_name = local.lambda_name
  role          = aws_iam_role.lambda.arn
  publish       = true
  runtime       = "nodejs12.x"
  handler       = "index"
  tags          = local.tags

  filename         = data.archive_file.lambdazip.source_file
  source_code_hash = filebase64sha256(data.archive_file.lambdazip.source_file)
}

resource aws_cloudwatch_log_group logs {
  count             = local.cloudwatch_log_retention_days == null ? 0 : 1
  name              = "/aws/lambda/${aws_lambda_function.lambda.function_name}"
  retention_in_days = local.cloudwatch_log_retention_days
  tags              = local.tags
}