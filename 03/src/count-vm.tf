resource "yandex_compute_instance" "vm_web" {
  depends_on = [yandex_compute_instance.vm_db]
  count=2
  name = "${var.vm_web_prename}-${count.index + 1}"
  platform_id = var.vm_platform_type
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
    preemptible = var.vm_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.metadata.metadata["serial-port-enable"]
    ssh-keys           = "${var.metadata.metadata["ssh-user"]}:${local.ssh_key}"
  }
}