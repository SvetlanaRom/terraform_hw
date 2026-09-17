locals {
  name_vm_web = "${var.vm_web_name}-${var.default_zone}"
  name_vm_db = "${var.vm_db_name}-${var.vm_db_zone}"
}