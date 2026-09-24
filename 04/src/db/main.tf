terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.16.0"
}

resource "yandex_mdb_mysql_cluster" "my_cluster" {
  name        = var.cluster_name
  environment = var.environment
  network_id  = var.network_id
  version     = var.version_db

  resources {
    resource_preset_id = var.resources_db["resource_preset_id"]
    disk_type_id       = var.resources_db["disk_type_id"]
    disk_size          = var.resources_db["disk_size"]
  }

  dynamic "host" {
    for_each = range(var.HA == true ? 2 : 1)
    content {
      zone      = var.zone
      subnet_id = var.subnet_id
    }
  }
}