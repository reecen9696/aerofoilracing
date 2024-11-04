resource "aws_s3_bucket" "site_bucket" {
  bucket = "${var.subdomain}${var.domain}"
}

resource "aws_s3_bucket_ownership_controls" "site_ownership_controls" {
  bucket = aws_s3_bucket.site_bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "site_access_block" {
  bucket = aws_s3_bucket.site_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "site_acl" {
  bucket = aws_s3_bucket.site_bucket.id
  acl    = "public-read"

  depends_on = [
    aws_s3_bucket_ownership_controls.site_ownership_controls,
    aws_s3_bucket_public_access_block.site_access_block
  ]
}