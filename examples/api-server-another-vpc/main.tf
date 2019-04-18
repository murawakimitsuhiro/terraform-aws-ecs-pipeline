provider "aws" {
  region = "ap-northeast-1"
}

locals {
  application_name       = "simple-go-ping"
  application_name_lower = "${replace(lower(local.application_name), "/[^a-z0-9]/", "")}"
}
