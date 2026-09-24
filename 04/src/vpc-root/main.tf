module "vpc_test_vm" {
  source         = "../vpc"
  create_network     = var.create_network_true
#  zone_name = var.zone_a
  subnet_name = var.subnet_a_name
  net_name = var.vpc_name
#  cidr_child = var.cidr_develop_a
  zone_name_and_cidr = var.zone_name_adn_cidr_a
}

module "vpc_example_vm" {
  source         = "../vpc"
  create_network     = var.create_network_false
#  zone_name = var.zone_b
  subnet_name = var.subnet_b_name
#  cidr_child = var.cidr_develop_b
  network_id = module.vpc_test_vm.info["0"].network_id
  net_name    = var.vpc_name
  zone_name_and_cidr = var.zone_name_adn_cidr_b
}