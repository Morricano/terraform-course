locals {
  tag_name = var.use_locals ? "forum" : var.bucket_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "${data.aws_caller_identity.current.account_id}-my-tf-test-bucket-module"
  use_locals  = true
}

module "table_authors_terraform" {
  source  = "./modules/dynamodb"
  context = module.label.context
  name    = "authors-terraform"
}

module "table_courses_terraform" {
  source  = "./modules/dynamodb"
  context = module.label.context
  name    = "courses-terraform"
}

module "lambdas" {
  source                       = "./modules/lambda"
  context                      = module.label.context
  table_authors_terraform_name = module.table_authors_terraform.id
}

resource "aws_s3_bucket" "example" {
  #   bucket = "891377012449-my-tf-test-bucket"
  bucket = module.label_s3.id

  tags = module.label_s3.tags
}
