output "s3_bucket_name" {
  value     = aws_s3_bucket.iac_public_bucket.id
  sensitive = false
}