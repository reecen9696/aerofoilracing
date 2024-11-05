
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.site_bucket.bucket_regional_domain_name
    origin_id                = "s3-${aws_s3_bucket.site_bucket.bucket}"
  }

  enabled             = true
  default_root_object = "index.html"

  aliases = [
    "${var.subdomain}${var.domain}"
  ]

  custom_error_response {
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-${aws_s3_bucket.site_bucket.bucket}"

    cache_policy_id  = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"

    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    Environment = var.environment
  }

  viewer_certificate {
    acm_certificate_arn            = data.aws_acm_certificate.sll_cert.arn
    ssl_support_method             = "sni-only"
  }

  

  depends_on = [ 
    aws_s3_bucket.site_bucket,
    data.aws_acm_certificate.sll_cert
  ]
}