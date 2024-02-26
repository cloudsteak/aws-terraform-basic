terraform {
  backend "s3" {
    bucket         = "cs-terraform-snd"
    key            = "state/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "cs-terraform-snd-lock"
    encrypt        = true
  }
}
