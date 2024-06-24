terraform {
  required_version = ">= 1.5.6"
  required_providers {
    platform = {
      source  = "jfrog/platform"
      version = "1.8.0"
    }
  }
}

resource "platform_license" "this" {
  count = var.managed_license ? 1 : 0

  key = var.license_key
}

resource "platform_myjfrog_ip_allowlist" "this" {
  count = var.managed_whitelist ? 1 : 0

  server_name = var.server_name
  ips         = var.ips
}