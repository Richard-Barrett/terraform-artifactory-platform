<img align="right" width="60" height="60" src="images/terraform.png">

# terraform-artifactory-platform
Terraform Module for Managing JFrog Platform for Artifactory

This Terraform module manages the JFrog Platform License and IP Allowlist resources. Here's a brief overview:

1. **JFrog Platform License**: This resource is managed by the `jfrog_platform_license` module. It creates, updates, and deletes a JFrog Platform License. The creation of this resource can be controlled by the `managed_license` variable. If `managed_license` is set to `true`, the resource will be created; if it's `false`, the resource will not be created.
2. **JFrog Platform IP Allowlist**: This resource is managed by the `jfrog_platform_myjfrog_ip_allowlist` module. It creates, updates, and deletes an IP Allowlist for the JFrog Platform. The creation of this resource can be controlled by the `managed_whitelist` variable. If `managed_whitelist` is set to `true`, the resource will be created; if it's `false`, the resource will not be created.

The module takes the following inputs:

- `license_key`: The license key for the JFrog Platform.
- `managed_license`: A boolean that determines whether the `platform_license` resource should be created.
- `managed_whitelist`: A boolean that determines whether the `platform_myjfrog_ip_allowlist` resource should be created.
- `ips`: List of IP addresses for the whitelist.
- `server_name`: The name of the server.

This module provides a convenient way to manage JFrog Platform resources in a declarative manner.

Example CICD with `BitBucket` and `Codefresh`:

![Image](./images/diagram.png)

## Notes

Here are some notes about this repository:

1. `Purpose`: This repository contains a Terraform module for managing JFrog Platform resources, specifically the License and IP Allowlist.
2. `Module` Structure: The module is structured into two main parts, each managing a specific JFrog Platform resource. The jfrog_platform_license module manages the JFrog Platform License, and the jfrog_platform_myjfrog_ip_allowlist module manages the IP Allowlist.
3. `Inputs`: The module takes several inputs including `license_key`, `managed_license`, `managed_whitelist`, `ips`, and `server_name`. These inputs allow for customization and control over the resources being managed.
4. `Optional` Resources: The creation of the License and IP Allowlist resources can be controlled by the managed_license and managed_whitelist variables respectively. This provides flexibility in managing these resources.
5. `Usage`: To use this module, you need to provide values for the required variables and then call the module in your Terraform configuration. The module will then manage the JFrog Platform resources based on the provided inputs.
6. `Versioning`: It's recommended to use version control for this repository to track changes and manage releases. This will also allow users to use specific versions of the module.
7. `Documentation`: It's important to maintain good documentation for this repository. This includes comments in the code, a README file explaining how to use the module, and any other relevant information.
8. `Testing`: Consider implementing some form of testing for this module. This could be in the form of Terraform validation checks, unit tests, or integration tests.

## Usage

The following includes some examples on how you can use this module.

### Minimal Usage

Minimal usage using the default values:

```hcl
module "jfrog_platform" {
  source  = "https://github.com/Richard-Barrett/terraform-artifactory-platform"
  version = "1.0.0"

  managed_license   = true
  managed_whitelist = true

  license_key      = "your-license-key"
  ips              = ["192.0.2.0", "203.0.113.0"]
  server_name      = "your-server-name"
}
```

### Basic Usage

Here is an example to just use the license

```hcl
module "jfrog_platform" {
  source  = "https://github.com/Richard-Barrett/terraform-artifactory-platform"
  version = "1.0.0"

  managed_license  = true
  managed_whitelist = false

  license_key      = "your-license-key"
}
```

### Considerations

When using this Terraform module, you should consider the following:

1. **Terraform Version**: Ensure you're using a compatible version of Terraform. This module may use features that are only available in certain versions of Terraform.

2. **Provider Version**: The module is designed to work with the JFrog provider. Make sure you're using a compatible version of this provider.

3. **Inputs**: Make sure you understand all the input variables and provide appropriate values for them. Incorrect inputs can lead to errors or unexpected behavior.

4. **Optional Resources**: The creation of the License and IP Allowlist resources can be controlled by the `managed_license` and `managed_whitelist` variables respectively. Be aware of the implications of enabling or disabling these resources.

5. **Credentials**: The module will likely need credentials to interact with the JFrog Platform. Make sure these are securely managed and correctly provided to the module.

6. **Idempotency**: Terraform is designed to be idempotent, meaning you can run the same configuration multiple times and get the same result. However, certain changes (like changing an input variable) can cause a resource to be recreated, which might not be what you want.

7. **State Management**: Terraform keeps track of your resources in a state file. It's important to manage this file correctly, especially if you're working in a team. Consider using remote state storage and state locking for better collaboration and to prevent conflicts.

8. **Error Handling**: Be prepared to handle errors during execution. This could be due to API rate limits, network issues, or other transient errors. Some of these can be mitigated by using features like Terraform's retry logic.

9. **Cost**: The resources created by this module may incur costs in your JFrog Platform account. Make sure you understand these costs and have budgeted for them.

10. **Security**: Consider the security implications of the resources being created by this module. This includes network access to and from the resources, and access control for the resources themselves.

## Overview

1. **JFrog Platform License**: This resource is managed by the `jfrog_platform_license` module. It creates, updates, and deletes a JFrog Platform License. The creation of this resource can be controlled by the `managed_license` variable. If `managed_license` is set to `true`, the resource will be created; if it's `false`, the resource will not be created.
2. **JFrog Platform IP Allowlist**: This resource is managed by the `jfrog_platform_myjfrog_ip_allowlist` module. It creates, updates, and deletes an IP Allowlist for the JFrog Platform. The creation of this resource can be controlled by the `managed_whitelist` variable. If `managed_whitelist` is set to `true`, the resource will be created; if it's `false`, the resource will not be created.

### Inputs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.6 |
| <a name="requirement_platform"></a> [platform](#requirement\_platform) | 1.7.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_platform"></a> [platform](#provider\_platform) | 1.7.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [platform_license.this](https://registry.terraform.io/providers/jfrog/platform/1.7.4/docs/resources/license) | resource |
| [platform_myjfrog_ip_allowlist.this](https://registry.terraform.io/providers/jfrog/platform/1.7.4/docs/resources/myjfrog_ip_allowlist) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ips"></a> [ips](#input\_ips) | List of IP addresses for the whitelist. | `list(string)` | `[]` | no |
| <a name="input_license_key"></a> [license\_key](#input\_license\_key) | The license key for the JFrog Platform. | `string` | n/a | yes |
| <a name="input_managed_license"></a> [managed\_license](#input\_managed\_license) | If set to true, the platform\_license resource will be created. | `bool` | `false` | no |
| <a name="input_managed_whitelist"></a> [managed\_whitelist](#input\_managed\_whitelist) | If set to true, the platform\_myjfrog\_ip\_allowlist resource will be created. | `bool` | `false` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | The name of the server. | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
