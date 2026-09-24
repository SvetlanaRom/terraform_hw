#provider
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
#test_vm

variable "test_vm_env_name" {
    type        = string
    default     = "develop"
}

variable "test_vm_instance_name" {
    type        = string
    default     = "webs"
}

variable "test_vm_instance_count" {
    type        = number
    default     = 2
}

variable "test_vm_image_family" {
    type        = string
    default     = "ubuntu-2404-lts-oslogin"
}

variable "test_vm_public_ip" {
    type        = bool
    default     = true
}

variable "test_vm_labels" {
    type        = map(string)
    default     = {
        project = "marketing"
    }
}

locals {
#    test_vm_network_id = yandex_vpc_network.develop.id
#    test_vm_subnet_ids = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
    test_vm_metadata = {
        user-data          = data.template_file.cloud_init.rendered
        serial-port-enable = 1
    }
}

#example-vm
variable "example_vm_env_name" {
    type        = string
    default     = "stage"
}

variable "example_vm_instance_name" {
    type        = string
    default     = "web-stage"
}

variable "example_vm_instance_count" {
    type        = number
    default     = 1
}

variable "example_vm_image_family" {
    type        = string
    default     = "ubuntu-2404-lts-oslogin"
}

variable "example_vm_public_ip" {
    type        = bool
    default     = true
}

variable "example_vm_labels" {
    type        = map(string)
    default     = {
        project = "analytics"
    }
}

locals {
#    example_vm_network_id = yandex_vpc_network.develop.id
#    example_vm_subnet_ids = [yandex_vpc_subnet.develop_a.id]
    example_vm_metadata = {
        user-data          = data.template_file.cloud_init.rendered
        serial-port-enable = 1
    }
}