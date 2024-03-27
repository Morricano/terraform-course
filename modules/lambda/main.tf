module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
}

module "label_get_all_authors-terraform" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name    = "get-all-authors-terraform"
}

module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_all_authors-terraform.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get_all_authors_terraform"

  environment_variables = {
    TABLE_NAME = var.table_authors_terraform_name
  }

  tags = module.label_get_all_authors-terraform.tags
}
