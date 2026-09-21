resource "yandex_compute_disk" "disk" {
  count = 3
  name        = "${var.disk-params.disk_name}-${count.index}"
  size      = var.disk-params.disk_size
  type      = var.disk-params.disk_type
}

resource "yandex_compute_instance" "storage" {
  name = var.storage-params.vm_name
  platform_id = var.vm_platform_type
  resources {
    cores         = var.storage-params.cpu
    memory        = var.storage-params.ram
    core_fraction = var.storage-params.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic "secondary_disk"{
    for_each = yandex_compute_disk.disk
    content {
      disk_id = secondary_disk.value.id
    }
  }
  allow_stopping_for_update = var.allow_stopping_for_update
  scheduling_policy {
    preemptible = var.vm_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_nat_disk
  }

  metadata = {
    serial-port-enable = var.metadata.metadata["serial-port-enable"]
    ssh-keys           = "${var.metadata.metadata["ssh-user"]}:${local.ssh_key}"
  }
}