provider "aws" {
  alias = "virginia"
  region = "us-east-1"
}

data "aws_acm_certificate" "sll_cert" {
  domain   = "${var.subdomain}${var.domain}"
  statuses = ["ISSUED"]
  provider = aws.virginia
}