# variable "example_vm_env_name" {
#     type        = string
#     default     = "stage"
# }

# # variable "example_vm_subnet_zones" {
# #     type        = list(string)
# #     default     = ["ru-central1-a"]
# # }

# locals {
# #    example_vm_network_id = yandex_vpc_network.develop.id
# #    example_vm_subnet_ids = [yandex_vpc_subnet.develop_a.id]
#     example_vm_metadata = {
#         user-data          = data.template_file.cloud_init.rendered
#         serial-port-enable = 1
#     }
# }

# variable "example_vm_instance_name" {
#     type        = string
#     default     = "web-stage"
# }

# variable "example_vm_instance_count" {
#     type        = number
#     default     = 1
# }

# variable "example_vm_image_family" {
#     type        = string
#     default     = "ubuntu-2404-lts-oslogin"
# }

# variable "example_vm_public_ip" {
#     type        = bool
#     default     = true
# }

# variable "example_vm_labels" {
#     type        = map(string)
#     default     = {
#         project = "analytics"
#     }
# }