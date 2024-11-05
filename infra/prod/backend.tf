terraform {
  backend "s3" {
    bucket = "tf-state-ap-southeast-1-533267163341"
    key = "terraform/infra/stride-landing-page"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-state-locks"
  }
}