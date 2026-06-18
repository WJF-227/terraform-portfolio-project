
# S3 Bucket

resource "aws_s3_bucket" "nextjs_bucket" {

  bucket = "nextjs-portfolio-josh-farah"

}


# Ownership Controls

resource "aws_s3_bucket_ownership_controls" "nextjs_bucket_ownership_controls" {

  bucket = aws_s3_bucket.nextjs_bucket.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}


# Public Access Block

resource "aws_s3_bucket_public_access_block" "nextjs_bucket_public_access_block" {

  bucket = aws_s3_bucket.nextjs_bucket.id

  block_public_acls = false

  block_public_policy = false

  ignore_public_acls = false

  restrict_public_buckets = false

}


# Bucket ACL

resource "aws_s3_bucket_acl" "nextjs_bucket_acl" {

  depends_on = [

    aws_s3_bucket_ownership_controls.nextjs_bucket_ownership_controls,

    aws_s3_bucket_public_access_block.nextjs_bucket_public_access_block

  ]

  bucket = aws_s3_bucket.nextjs_bucket.id

  acl = "public-read"

}


# Website Configuration

resource "aws_s3_bucket_website_configuration" "nextjs_bucket_website" {

  bucket = aws_s3_bucket.nextjs_bucket.id

  index_document {

    suffix = "index.html"

  }

  error_document {

    key = "index.html"

  }

}


# Bucket Policy

resource "aws_s3_bucket_policy" "nextjs_bucket_policy" {

  bucket = aws_s3_bucket.nextjs_bucket.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "PublicReadGetObject"

        Effect = "Allow"

        Principal = "*"

        Action = "s3:GetObject"

        Resource = "${aws_s3_bucket.nextjs_bucket.arn}/*"

      }

    ]

  })

}


# CloudFront Distribution

resource "aws_cloudfront_distribution" "nextjs_distribution" {

  enabled             = true
  default_root_object = "index.html"

  origin {

    domain_name = aws_s3_bucket_website_configuration.nextjs_bucket_website.website_endpoint

    origin_id = "nextjs-s3-origin"

    custom_origin_config {

      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"

      origin_ssl_protocols = [
        "TLSv1.2"
      ]

    }

  }

  default_cache_behavior {

    allowed_methods = [
      "GET",
      "HEAD"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    target_origin_id = "nextjs-s3-origin"

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {

      query_string = false

      cookies {

        forward = "none"

      }

    }

  }

  restrictions {

    geo_restriction {

      restriction_type = "none"

    }

  }

  viewer_certificate {

    cloudfront_default_certificate = true

  }

  price_class = "PriceClass_100"

  tags = {

    Name = "NextJS Portfolio"

  }

}