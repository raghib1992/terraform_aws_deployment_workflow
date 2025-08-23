data "terraform_remote_state" "basket" {
  backend = "s3"
  config = {
    bucket = "sandbox-statefile-terraform"
    key    = "terraform/basket/terraform.tfstate"
    region = "us-east-1"
  }
}