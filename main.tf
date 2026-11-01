terraform {
  required_version = ">= 1.10"

  backend "s3" {
    bucket = "tfstate"
    key    = "lab/dev/terraform.tfstate"
    region = "us-east-1"

    endpoints                   = { s3 = "http://127.0.0.1:9000" }
    use_path_style              = true
    use_lockfile                = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}

resource "terraform_data" "hello" {
  input = "state test"
}