output "bucket_id" {
  value = aws_s3_bucket.example.id
}

output "bucket_arn" {
  value = aws_s3_bucket.example.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.example.bucket_domain_name
}

output "bucket_regional_domain_name" {
  value     = aws_s3_bucket.example.bucket_regional_domain_name
  sensitive = true
}

#########

output "module_bucket_id" {
  value = module.s3.bucket_id
}

output "module_bucket_arn" {
  value = module.s3.bucket_arn
}

output "module_bucket_domain_name" {
  value = module.s3.bucket_domain_name
}

output "module_bucket_regional_domain_name" {
  value = module.s3.bucket_regional_domain_name
}

########

output "courses_terraform_table_name" {
  value = module.table_courses_terraform.id
}

output "courses_terraform_table_arn" {
  value = module.table_courses_terraform.arn
}

output "authors_terraform_table_name" {
  value = module.table_authors_terraform.id
}

output "authors_terraform_table_arn" {
  value = module.table_authors_terraform.arn
}
