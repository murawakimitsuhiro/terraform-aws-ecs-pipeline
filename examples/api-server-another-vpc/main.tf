provider "aws" {
  region = "ap-northeast-1"
}

locals {
  application_name       = "go-simple-restful-api"
  application_name_lower = "${replace(lower(local.application_name), "/[^a-z0-9]/", "")}"
}
