variable "cluster_id" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_user_password" {
  type = string
}

variable "user_roles" {
  type = list(string)
  default = ["ALL"]
}

variable "authentication_plugin" {
  type = string
  default = "MYSQL_NATIVE_PASSWORD"
}

variable "db_name" {
  type = string
}