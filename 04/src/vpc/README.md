## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.16.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_vpc_network.child_network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.child_subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cidr_child"></a> [cidr\_child](#input\_cidr\_child) | n/a | `list(string)` | n/a | yes |
| <a name="input_net_name"></a> [net\_name](#input\_net\_name) | VPC network&subnet name | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | n/a | `string` | `null` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | VPC network&subnet name | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Zone name | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_info"></a> [info](#output\_info) | n/a |
