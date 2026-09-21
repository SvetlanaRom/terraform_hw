variable "disk-params" {
    type = object({
        disk_name = string
        disk_size = number
        disk_type      = string
    })
    default = {
        disk_name = "disk"
        disk_size = 1
        disk_type      = "network-hdd"
    }
  
}

variable "storage-params" {
    type = object({
        vm_name = string
        cpu     = number
        ram     = number
        core_fraction = number
    })
    default = {
        vm_name = "storage"
        cpu     = 2
        ram     = 2
        core_fraction = 20
        }

}

variable "allow_stopping_for_update" {
    type        = bool
    default     = true
    description = "allow stopping for update"
}

variable "vm_nat_disk" {
  type        = bool
  default     = false
  description = "use NAT for disk VM or not"
}