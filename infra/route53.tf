data "aws_route53_zone" "hosted_zone" {
    name         = var.hosted_zone_name
}

resource "aws_route53_record" "site_a_record" {
    zone_id = data.aws_route53_zone.hosted_zone.zone_id
    name    = "${var.subdomain}${var.domain}"
    type    = "A"

    alias {
        name                   = aws_cloudfront_distribution.s3_distribution.domain_name
        zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
        evaluate_target_health = false
    }

    depends_on = [ 
        aws_cloudfront_distribution.s3_distribution,
        data.aws_route53_zone.hosted_zone    
    ]
}