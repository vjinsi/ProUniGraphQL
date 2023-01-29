#variable "accountId" {}

data "aws_caller_identity" "current" {}

#data.aws_caller_identity.current.account_id

data "aws_region" "current" {}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  ############################################
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "create_lambda_function_policy" {
  name = "create_lambda_function_policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents",
              "ec2:CreateNetworkInterface",
              "ec2:DescribeNetworkInterfaces",
              "ec2:DeleteNetworkInterface",
              "ec2:AssignPrivateIpAddresses",
              "ec2:UnassignPrivateIpAddresses"
          ],
          "Resource": "*"
      }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "create_lambda_function_policy" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.create_lambda_function_policy.arn
}


resource "aws_lambda_function" "lambda_function" {

  filename      = "${path.module}/../prouni/target/prouni-1.0-SNAPSHOT.jar"
  function_name = "LambdaGraphQL2"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "com.graphqllambda.LambdaHandler"

  source_code_hash = filebase64sha256("${path.module}/../prouni/target/prouni-1.0-SNAPSHOT.jar")
  timeout          = 60
  memory_size      = 1012

  ephemeral_storage {
    size = 1012
  }

  vpc_config {
    subnet_ids         = [aws_subnet.subnet-az1.id, aws_subnet.subnet-az2.id]
    security_group_ids = [aws_security_group.demo.id]
  }

  runtime = "java11"

  environment {
    variables = {
      DATABASE_NAME = "prouni"
      DB_PASS       = "mypassword"
      DB_PORT       = 3306
      DB_USER_NAME  = "admin"
      END_POINT     = "${aws_db_instance.prouni_rds.endpoint}"
      REGION        = "${data.aws_region.current.name}"
    }
  }
}



resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.demo.id}/*/${aws_api_gateway_method.demo-post.http_method}${aws_api_gateway_resource.demo.path}"
}