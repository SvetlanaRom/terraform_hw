variable "HA" {
  type = bool
  default = true
}

variable "cluster_name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "environment" {
  type = string
  default = "PRESTABLE"
}

variable "version_db" {
  type = string
  default = "8.4"
}

variable "resources_db" {
  type = object({
    resource_preset_id = string
    disk_type_id = string
    disk_size = number
  })
  default = {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-hdd"
    disk_size          = 10
  }
}

variable "zone" {
  type = string
  default = "ru-central1-d"
}

variable "subnet_id" {
  type = string
}