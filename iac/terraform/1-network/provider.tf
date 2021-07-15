provider "aws" {
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${var.role_account_id}:role/${var.role_name}"
  }
}