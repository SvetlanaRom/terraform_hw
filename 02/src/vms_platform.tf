# common
variable "common_metadata" {
  type = map(object({
    ssh-user = string
    ssh_root_key = string
    serial-port-enable = number
  }))
  default = {
    metadata = {
      ssh-user = "ubuntu"
      ssh_root_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDOsBLemvv77xK6KbLRwOhjLN3co4AN0WldDcm3olPmc svetarom@NB-MSK-1095"
      serial-port-enable = 1
    }
  }
  description = "common metadata for VMs"
}

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDOsBLemvv77xK6KbLRwOhjLN3co4AN0WldDcm3olPmc svetarom@NB-MSK-1095"
#   description = "ssh-keygen -t ed25519"
# }

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vms_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image for VM"
}

variable "resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  })) 
  default = {
    vm_web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    vm_db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
  description = "resources for VMs"
    
}

# for web VM
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name for VM web"
}

variable "vm_web_platform_type" {
  type        = string
  default     = "standard-v3"
  description = "platform type for VM web"
}

# variable "vm_web_resources" {
#   type        = map(number)
#   default     = {
#     cores         = 2
#     memory        = 1
#     core_fraction = 20
#   }
#   description = "resources for VM web"
# }

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "use preemptible instance or not for VM web"
}

variable "vm_web_nat" {
  type        = bool
  default     = false
  description = "use NAT for VM web or not"
}

# variable "vm_web_metadata" {
#   type        = object({
#     serial-port-enable = number
#     ssh-user           = string
#   })
#   default     = {
#     serial-port-enable = 1
#     ssh-user           = "ubuntu"
#   }
#   description = "metadata for VM web"
# }

#for database VM
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name for VM database"
}

variable "vm_db_platform_type" {
  type        = string
  default     = "standard-v3"
  description = "platform type for VM database"
}

# variable "vm_db_resources" {
#   type        = map(number)
#   default     = {
#     cores         = 2
#     memory        = 2
#     core_fraction = 20
#   }
#   description = "resources for VM database"
# }

variable "vm_db_resources" {
  type        = map(number)
  default     = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  description = "resources for VM database"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "use preemptible instance or not for VM database"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope for VM database"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_nat" {
  type        = bool
  default     = false
  description = "use NAT for VM database or not"
}

# variable "vm_db_metadata" {
#   type        = object({
#     serial-port-enable = number
#     ssh-user           = string
#   })
#   default     = {
#     serial-port-enable = 1
#     ssh-user           = "ubuntu"
#   }
#   description = "metadata for VM database"
# }
