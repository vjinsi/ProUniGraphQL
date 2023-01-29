resource "aws_api_gateway_rest_api" "demo" {
  name = "REST-GraphQL-PROUNI"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "demo" {
  parent_id   = aws_api_gateway_rest_api.demo.root_resource_id
  path_part   = "LambdaGraphQL2"
  rest_api_id = aws_api_gateway_rest_api.demo.id
}

resource "aws_api_gateway_method" "demo-post" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.demo.id
  rest_api_id   = aws_api_gateway_rest_api.demo.id
}

resource "aws_api_gateway_integration" "demo" {
  http_method             = aws_api_gateway_method.demo-post.http_method
  integration_http_method = "POST"
  resource_id             = aws_api_gateway_resource.demo.id
  rest_api_id             = aws_api_gateway_rest_api.demo.id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_function.invoke_arn
}

resource "aws_api_gateway_deployment" "demo" {
  rest_api_id = aws_api_gateway_rest_api.demo.id

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_api_gateway_method.demo-post, aws_api_gateway_integration.demo]
}

resource "aws_api_gateway_stage" "prouni-demo" {
  deployment_id = aws_api_gateway_deployment.demo.id
  rest_api_id   = aws_api_gateway_rest_api.demo.id
  stage_name    = "prouni-demo"
}