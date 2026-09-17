output "vms_info" {
  value       = [
    {
      role    = "web"
      vm_name = yandex_compute_instance.platform.name
      vm_id   = yandex_compute_instance.platform.fqdn
      vm_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    },
    {
      role    = "db"
      vm_name = yandex_compute_instance.database.name
      vm_id   = yandex_compute_instance.database.fqdn
      vm_ip   = yandex_compute_instance.database.network_interface.0.nat_ip_address
    }
  ]
  description = "info outputs for VMs"
}