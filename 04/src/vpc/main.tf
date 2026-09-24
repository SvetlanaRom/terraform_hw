terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.16.0"
}

resource "yandex_vpc_network" "child_network" {
  count = var.create_network == true ? 1 : 0
  name = var.net_name
}

resource "yandex_vpc_subnet" "child_subnet" {
  for_each = { for i, v in var.zone_name_and_cidr: tostring(i) => v }
  name           = "${var.subnet_name}-${each.key}"
  zone           = each.value["zone"]
  network_id     = var.create_network ? yandex_vpc_network.child_network[0].id : var.network_id
  v4_cidr_blocks =  [each.value["cidr"]]
  lifecycle {
    precondition {
      condition     = var.create_network || var.network_id != null
      error_message = "create_network = false передайте network_id."
    }
  }
}