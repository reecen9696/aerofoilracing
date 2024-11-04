variable "environment" {
  description = "deployment environment (dev, test, prod)"
  type        = string
}

variable "hosted_zone_name" {
  description = "hosted zone name"
  type        = string
}

variable "domain" {
  description = "domain - formatted as <domain>.<topleveldomain>"
  type        = string
}

variable "subdomain" {
  description = "sumdomain - formatted as <subdomain>."
  type        = string
}