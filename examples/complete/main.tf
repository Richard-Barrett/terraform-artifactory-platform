terraform {
  required_version = ">= 1.5.6"
  required_providers {
    platform = {
      source  = "jfrog/platform"
      version = "1.7.4"
    }
  }
}

provider "platform" {}

module "jfrog_platform_license" {
  source = "../.." # Path to the root of the JFrog Platform Terraform provider repository

  managed_license   = true
  managed_whitelist = false

  license_key = "my-license-key"
}