output "info" {
    value = {
      for k, v in yandex_vpc_subnet.child_subnet : k => {
      id   = v.id
      zone = v.zone
      cidr = v.v4_cidr_blocks
      name_subnet = v.name
      name_network = var.create_network ? yandex_vpc_network.child_network[0].name : var.net_name
      network_id = var.create_network ? yandex_vpc_network.child_network[0].id : var.network_id
    }
  }
}