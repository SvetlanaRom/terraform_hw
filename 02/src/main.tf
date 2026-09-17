resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_gateway" "nat_gateway" {
  name           = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_route_table" "rt" {
  name       = "test-route-table"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

data "yandex_compute_image" "ubuntu" {
  family = var.vms_image
}

resource "yandex_compute_instance" "platform" {
  name        = local.name_vm_web
  platform_id = var.vm_web_platform_type
  resources {
    cores         = var.resources["vm_web"]["cores"]
    memory        = var.resources["vm_web"]["memory"]
    core_fraction = var.resources["vm_web"]["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = var.common_metadata.metadata["serial-port-enable"]
    ssh-keys           = "${var.common_metadata.metadata["ssh-user"]}:${var.common_metadata.metadata["ssh_root_key"]}"
  }

}

resource "yandex_vpc_subnet" "develop-db" {
  name           = "${var.vpc_name}-db"
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_compute_instance" "database" {
  name        = local.name_vm_db
  platform_id = var.vm_db_platform_type
  resources {
    cores         = var.resources["vm_db"]["cores"]
    memory        = var.resources["vm_db"]["memory"]
    core_fraction = var.resources["vm_db"]["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  zone = var.vm_db_zone
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-db.id
    nat       = var.vm_db_nat
  }

  metadata = {
    serial-port-enable = var.common_metadata.metadata["serial-port-enable"]
    ssh-keys           = "${var.common_metadata.metadata["ssh-user"]}:${var.common_metadata.metadata["ssh_root_key"]}"
  }

}