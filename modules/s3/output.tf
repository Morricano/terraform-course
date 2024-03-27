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
  value = aws_s3_bucket.example.bucket_regional_domain_name
}
