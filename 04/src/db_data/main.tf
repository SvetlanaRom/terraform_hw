terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.16.0"
}

resource "yandex_mdb_mysql_user" "my_user" {
  cluster_id = var.cluster_id
  name       = var.db_user
  password   = var.db_user_password

  permission {
    database_name = yandex_mdb_mysql_database.my_db.name
    roles         = var.user_roles
  }

  authentication_plugin = var.authentication_plugin
}

resource "yandex_mdb_mysql_database" "my_db" {
  cluster_id = var.cluster_id
  name       = var.db_name
}