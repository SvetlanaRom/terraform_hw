variable "vm_web_prename" {
  type        = string
  default     = "web"
  description = "prename for web VMs"
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
  }
  description = "resources for web VMs"
    
}
