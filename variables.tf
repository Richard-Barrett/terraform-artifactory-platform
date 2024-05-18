variable "ips" {
  description = "List of IP addresses for the whitelist."
  type        = list(string)
  default     = []
}

variable "license_key" {
  description = "The license key for the JFrog Platform."
  type        = string
}

variable "managed_license" {
  description = "If set to true, the platform_license resource will be created."
  type        = bool
  default     = false
}

variable "managed_whitelist" {
  description = "If set to true, the platform_myjfrog_ip_allowlist resource will be created."
  type        = bool
  default     = false
}

variable "server_name" {
  description = "The name of the server."
  type        = string
  default     = ""
}
