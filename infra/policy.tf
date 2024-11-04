data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    resources = [
        aws_s3_bucket.site_bucket.arn,
        "${aws_s3_bucket.site_bucket.arn}/*"
    ]

    principals {
        type        = "*"
        identifiers = ["*"]
    }
  }

}

resource "aws_s3_bucket_policy" "site_bucket_policy" {
    bucket = aws_s3_bucket.site_bucket.id
    policy = data.aws_iam_policy_document.s3_bucket_policy.json

    depends_on = [ aws_s3_bucket_public_access_block.site_access_block ]
}

