variable "vm_platform_type" {
  type        = string
  default     = "standard-v3"
  description = "platform type for VMs"
}

variable "metadata" {
  type = map(object({
    ssh-user = string
    serial-port-enable = number
  }))
  default = {
    metadata = {
      ssh-user = "ubuntu"
      serial-port-enable = 1
    }
  }
  description = "metadata for VMs"
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "use preemptible instance or not for VMs"
}

variable "vm_nat" {
  type        = bool
  default     = true
  description = "use NAT for VMs or not"
}

variable "vms_image" {
  type        = string
  default     = "ubuntu-2404-lts-oslogin"
  description = "image for VMs"
}