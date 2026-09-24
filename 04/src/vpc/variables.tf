variable "net_name" {
  type        = string
  description = "VPC network&subnet name"
}

variable "subnet_name" {
  type        = string
  description = "VPC network&subnet name"
}

# variable "cidr_child" {
#   type        = list(string)
# }

# variable "zone_name" {
#   type        = string
#   description = "Zone name"
# }

variable "network_id" {
  type        = string
  default     = null
}

variable "zone_name_and_cidr" {
  type = list(object({
    zone = string
    cidr = string
  }))
}

variable "create_network" {
  type    = bool
  default = true
}

