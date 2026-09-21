resource "yandex_compute_instance" "vm_db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }
  name = each.key 
  platform_id = var.vm_platform_type
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
    }
  }
  scheduling_policy {
    preemptible = var.vm_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_nat
  }

  metadata = {
    serial-port-enable = var.metadata.metadata["serial-port-enable"]
    ssh-keys           = "${var.metadata.metadata["ssh-user"]}:${local.ssh_key}"
  }
}