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

#vpc_test_vm

variable "subnet_a_name" {
  type        = string
  default     = "develop_a"
  description = "VPC network&subnet name"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "zone_name_adn_cidr_a" {
  type = list(object({
    zone = string
    cidr = string
  }))
  default = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
}

#vpc_example_vm

variable "subnet_b_name" {
  type        = string
  default     = "develop_b"
  description = "VPC network&subnet name"
}

variable "zone_name_adn_cidr_b" {
  type = list(object({
    zone = string
    cidr = string
  }))
  default = [
    { zone = "ru-central1-a", cidr = "10.0.4.0/24" },
  ]
}

#common
variable "create_network_true" {
  type = bool
  default = true
}

variable "create_network_false" {
  type = bool
  default = false
}