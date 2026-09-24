# variable "test_vm_env_name" {
#     type        = string
#     default     = "develop"
# }

# # variable "test_vm_subnet_zones" {
# #     type        = list(string)
# #     default     = ["ru-central1-a","ru-central1-b"]
# # }

# locals {
# #    test_vm_network_id = yandex_vpc_network.develop.id
# #    test_vm_subnet_ids = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
#     test_vm_metadata = {
#         user-data          = data.template_file.cloud_init.rendered
#         serial-port-enable = 1
#     }
# }

# variable "test_vm_instance_name" {
#     type        = string
#     default     = "webs"
# }

# variable "test_vm_instance_count" {
#     type        = number
#     default     = 2
# }

# variable "test_vm_image_family" {
#     type        = string
#     default     = "ubuntu-2404-lts-oslogin"
# }

# variable "test_vm_public_ip" {
#     type        = bool
#     default     = true
# }

# variable "test_vm_labels" {
#     type        = map(string)
#     default     = {
#         project = "marketing"
#     }
# }