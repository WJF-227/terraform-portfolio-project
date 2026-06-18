
# Terraform Outputs

output "s3_bucket_name" {
  description = "Name of the S3 bucket hosting the static website"
  value       = aws_s3_bucket.nextjs_bucket.bucket
}

output "s3_website_endpoint" {
  description = "S3 static website endpoint"
  value       = aws_s3_bucket_website_configuration.nextjs_bucket_website.website_endpoint
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.nextjs_distribution.domain_name
}

output "cloudfront_url" {
  description = "HTTPS URL for the CloudFront distribution"
  value       = "https://${aws_cloudfront_distribution.nextjs_distribution.domain_name}"
}