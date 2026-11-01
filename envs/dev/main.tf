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

module "app" {
  source    = "../../modules/app"
  env       = "dev"
  image     = "ghcr.io/draskovicsv-organization/python-health-app:sha-540483412f612709c2b8099a51e2d9e19db13530"
  host_port = 8081
}

output "url" {
  value = module.app.url
}