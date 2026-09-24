data "template_file" "cloud_init" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = file("${path.module}/id_ed25519.pub")
  }
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.test_vm_env_name
  network_id     = local.vpc_test["0"].network_id
  subnet_zones   = [for s in values(local.vpc_test) : s.zone]
  subnet_ids     = [for s in values(local.vpc_test) : s.id]
  instance_name  = var.test_vm_instance_name
  instance_count = var.test_vm_instance_count
  image_family   = var.test_vm_image_family
  public_ip      = var.test_vm_public_ip
  labels = var.test_vm_labels
  metadata = local.test_vm_metadata
}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.example_vm_env_name
  network_id     = local.vpc_example["0"].network_id
  subnet_zones   = [for s in values(local.vpc_example) : s.zone]
  subnet_ids     = [for s in values(local.vpc_example) : s.id]
  instance_name  = var.example_vm_instance_name
  instance_count = var.example_vm_instance_count
  image_family   = var.example_vm_image_family
  public_ip      = var.example_vm_public_ip
  labels = var.example_vm_labels
  metadata = local.example_vm_metadata
}