data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "${path.module}/../vpc-root/terraform.tfstate"
  }
}

locals {
  vpc_test    = data.terraform_remote_state.vpc.outputs.vpc_test_vm
  vpc_example = data.terraform_remote_state.vpc.outputs.vpc_example_vm
}