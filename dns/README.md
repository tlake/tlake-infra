# DNS

## Terraform Docs

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.5.5 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.0 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [cloudflare_record.exo_archive_org_github_pages_ipv6](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.tlake_io_github_pages_ipv6](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.tlake_io_subdomain_home_routes](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.tlake_io_subdomain_porkbun_routes](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.tlake_io_txt_challenges](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.www_tlake_io](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.zones](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [github_ip_ranges.this](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/ip_ranges) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | ID of the CloudFlare account. | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | API token used for interacting with the CloudFlare account. | `string` | n/a | yes |
| <a name="input_cloudflare_proxy_ttl"></a> [cloudflare\_proxy\_ttl](#input\_cloudflare\_proxy\_ttl) | Default CloudFlare proxy TTL. | `number` | `1` | no |
| <a name="input_home_ip_address"></a> [home\_ip\_address](#input\_home\_ip\_address) | The home IP address. | `string` | n/a | yes |
| <a name="input_porkbun_ip_address"></a> [porkbun\_ip\_address](#input\_porkbun\_ip\_address) | Porkbun IP address. | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
