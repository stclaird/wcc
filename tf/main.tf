provider "aws" {
  region                  = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket   = "os.prod.tfstate"
    key      = "wcc/terraform.tfstate"
    region   = "eu-west-2"
  }
}