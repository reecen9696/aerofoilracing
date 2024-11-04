terraform {
  backend "s3" {
    bucket = "tf-state-ap-southeast-2-533267244497"
    key = "terraform/infra/stride-landing-page"
    region = "ap-southeast-2"
    dynamodb_table = "terraform-state-locks"
  }
}