###cloud vars
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

variable "random_len" {
  type = number
  default = 8
}

variable "random_upper" {
  type = bool
  default = false
}

variable "random_lower" {
  type = bool
  default = true
}

variable "random_numeric" {
  type = bool
  default = true
}

variable "random_special" {
  type = bool
  default = false
}

variable "s3_size" {
  type = number
  default = 1073741824
}

variable "vault_path" {
  type = string
  default = "secret/example"
}

variable "vault_address" {
  type = string
  default = "http://127.0.0.1:8200"
}

variable "vault_skip_tls_verify" {
  type = bool
  default = true
}

variable "vault_token" {
  type = string
  default = "education"
}

variable "vault_path_new" {
  type = string
  default = "secret/my_credentials"
}

variable "vault_pass" {
  type = string
}

# # variable "zone_a" {
# #   type        = string
# #   default     = "ru-central1-a"
# #   description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
# # }

# # variable "zone_b" {
# #   type        = string
# #   default     = "ru-central1-b"
# #   description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
# # }

# # variable "cidr_develop_a" {
# #   type        = list(string)
# #   default     = ["10.0.1.0/24"]
# #   description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
# # }

# # variable "cidr_develop_b" {
# #   type        = list(string)
# #   default     = ["10.0.2.0/24"]
# #   description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
# # }

# variable "zone_name_adn_cidr_a" {
#   type = list(object({
#     zone = string
#     cidr = string
#   }))
#   default = [
#     { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
#     { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
#     { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
#   ]
# }

# variable "zone_name_adn_cidr_b" {
#   type = list(object({
#     zone = string
#     cidr = string
#   }))
#   default = [
#     { zone = "ru-central1-a", cidr = "10.0.4.0/24" },
#   ]
# }

# variable "vpc_name" {
#   type        = string
#   default     = "develop"
#   description = "VPC network&subnet name"
# }

# variable "subnet_b_name" {
#   type        = string
#   default     = "develop_b"
#   description = "VPC network&subnet name"
# }

# variable "subnet_a_name" {
#   type        = string
#   default     = "develop_a"
#   description = "VPC network&subnet name"
# }

# ###common vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "your_ssh_ed25519_key"
#   description = "ssh-keygen -t ed25519"
# }

# ###example vm_web var
# variable "vm_web_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
#   description = "example vm_web_ prefix"
# }

# ###example vm_db var
# variable "vm_db_name" {
#   type        = string
#   default     = "netology-develop-platform-db"
#   description = "example vm_db_ prefix"
# }

# variable "netname_for_db" {
#   type = string
#   default = "net_db"
# }

# variable "supnetname_for_db" {
#   type = string
#   default = "supnet_db"
# }

# variable "zone_name_and_db" {
#   type = list(object({
#     zone = string
#     cidr = string
#   }))
#   default = [
#     { zone = "ru-central1-d", cidr = "10.0.1.0/24" }
#   ]
# }

# variable "HA" {
#   type = bool
#   default = true
# }

# variable "cluster_name" {
#   type = string
#   default = "managed"
# }

# variable "db_user_password" {
#   type = string
# }

# variable "db_user" {
#   type = string
#   default = "test"
# }

# variable "db_name" {
#   type = string
#   default = "database1"
# }

# variable "HA_example" {
#   type = bool
#   default = true
# }

# variable "cluster_name_example" {
#   type = string
#   default = "example"
# }

# variable "db_user_example" {
#   type = string
#   default = "app"
# }

# variable "db_name_example" {
#   type = string
#   default = "test"
# }

# variable "create_network_true" {
#   type = bool
#   default = true
# }

# variable "create_network_false" {
#   type = bool
#   default = false
# }