variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number }))
  default = [
    {
    cpu = 2
    disk_volume = 10
    ram = 2
    core_fraction = 20
    vm_name = "main"
    },
    {
    cpu = 4
    disk_volume = 12
    ram = 4
    core_fraction = 20
    vm_name = "replica"
    }
  ]
}