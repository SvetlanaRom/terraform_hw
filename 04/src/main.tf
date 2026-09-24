# # resource "yandex_vpc_network" "develop" {
# #   name = var.vpc_name
# # }
# # resource "yandex_vpc_subnet" "develop_a" {
# #   name           = var.subnet_a_name
# #   zone           = var.zone_a
# #   network_id     = yandex_vpc_network.develop.id
# #   v4_cidr_blocks = var.cidr_develop_a
# # }

# # resource "yandex_vpc_subnet" "develop_b" {
# #   name           = var.subnet_b_name
# #   zone           = var.zone_b
# #   network_id     = yandex_vpc_network.develop.id
# #   v4_cidr_blocks = var.cidr_develop_b
# # }

# data "template_file" "cloud_init" {
#   template = file("${path.module}/cloud-init.yml")

#   vars = {
#     ssh_public_key = file("${path.module}/id_ed25519.pub")
#   }
# }

# module "test-vm" {
#   source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
#   env_name       = var.test_vm_env_name
#   network_id     = module.vpc_test_vm.info["0"].network_id
#   subnet_zones   = [for s in values(module.vpc_test_vm.info) : s.zone]
#   subnet_ids     = [for s in values(module.vpc_test_vm.info) : s.id]
#   instance_name  = var.test_vm_instance_name
#   instance_count = var.test_vm_instance_count
#   image_family   = var.test_vm_image_family
#   public_ip      = var.test_vm_public_ip
#   labels = var.test_vm_labels
#   metadata = local.test_vm_metadata
# }

# module "example-vm" {
#   source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
#   env_name       = var.example_vm_env_name
#   network_id     = module.vpc_example_vm.info["0"].network_id
#   subnet_zones   = [for s in values(module.vpc_example_vm.info) : s.zone]
#   subnet_ids     = [for s in values(module.vpc_example_vm.info) : s.id]
#   instance_name  = var.example_vm_instance_name
#   instance_count = var.example_vm_instance_count
#   image_family   = var.example_vm_image_family
#   public_ip      = var.example_vm_public_ip
#   labels = var.example_vm_labels
#   metadata = local.example_vm_metadata
# }

# module "vpc_test_vm" {
#   source         = "./vpc"
#   create_network     = var.create_network_true
# #  zone_name = var.zone_a
#   subnet_name = var.subnet_a_name
#   net_name = var.vpc_name
# #  cidr_child = var.cidr_develop_a
#   zone_name_and_cidr = var.zone_name_adn_cidr_a
# }

# module "vpc_example_vm" {
#   source         = "./vpc"
#   create_network     = var.create_network_false
# #  zone_name = var.zone_b
#   subnet_name = var.subnet_b_name
# #  cidr_child = var.cidr_develop_b
#   network_id = module.vpc_test_vm.info["0"].network_id
#   net_name    = var.vpc_name
#   zone_name_and_cidr = var.zone_name_adn_cidr_b
# }

# module "vpc_for_db" {
#   source         = "./vpc"
#   create_network     = var.create_network_true
#   subnet_name = var.supnetname_for_db
#   net_name    = var.netname_for_db
#   zone_name_and_cidr = var.zone_name_and_db
# }

# module "craete_cluster" {
#   source         = "./db"
#   HA = var.HA
#   cluster_name = var.cluster_name
#   network_id = module.vpc_for_db.info["0"].network_id
#   zone   = module.vpc_for_db.info["0"].zone
#   subnet_id     = module.vpc_for_db.info["0"].id
# } 

# module "add_data_to_cluster" {
#   source = "./db_data"
#   cluster_id = module.craete_cluster.info.cluster_id
#   db_user = var.db_user
#   db_user_password = var.db_user_password
#   db_name = var.db_name
# }

# module "craete_cluster_example" {
#   source         = "./db"
#   HA = var.HA_example
#   cluster_name = var.cluster_name_example
#   network_id = module.vpc_for_db.info["0"].network_id
#   zone   = module.vpc_for_db.info["0"].zone
#   subnet_id     = module.vpc_for_db.info["0"].id
# } 

# module "add_data_to_cluster_example" {
#   source = "./db_data"
#   cluster_id = module.craete_cluster_example.info.cluster_id
#   db_user = var.db_user_example
#   db_user_password = var.db_user_password
#   db_name = var.db_name_example
# }

resource "random_string" "unique_id" {
  length  = var.random_len
  upper   = var.random_upper
  lower   = var.random_lower
  numeric = var.random_numeric
  special = var.random_special
}

module "s3" {
  source = "./s3"

  bucket_name = "simple-bucket-${random_string.unique_id.result}"
  max_size    = var.s3_size
}

data "vault_generic_secret" "vault_example" {
  path = var.vault_path
}

resource "vault_generic_secret" "my_new_secret" {
  path = var.vault_path_new

  data_json = jsonencode({
    password = var.vault_pass
  })
}
