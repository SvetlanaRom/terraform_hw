resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl",{ 
  web_hosts = try(
    concat([], yandex_compute_instance.vm_web),
    values(tomap(yandex_compute_instance.vm_web)),
    [yandex_compute_instance.vm_web]
  )
  db_hosts = try(
    concat([], yandex_compute_instance.vm_db),
    values(tomap(yandex_compute_instance.vm_db)),
    [yandex_compute_instance.vm_db]
  )
  storage_hosts = try(
    concat([], yandex_compute_instance.storage),
    values(tomap(yandex_compute_instance.storage)),
    [yandex_compute_instance.storage]
  )
  })

  filename = "${abspath(path.module)}/hosts.ini"
}

# Задание 6
resource "local_sensitive_file" "ansible_secrets" {
  content  = jsonencode({
    secrets = { for k, v in random_password.each : k => v.result }
  })
  filename = "${path.module}/secrets_vars.json"
}

resource "null_resource" "web_hosts_provision" {
  depends_on = [yandex_compute_instance.vm_web, 
                 yandex_compute_instance.vm_db, 
                 yandex_compute_instance.storage, 
                 local_file.hosts_templatefile,
                 local_sensitive_file.ansible_secrets]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${abspath(path.module)}/hosts.ini --private-key=/home/svetarom/.ssh/id_ed25519 --extra-vars '@${local_sensitive_file.ansible_secrets.filename}' ${abspath(path.module)}/test.yml"
    on_failure  = continue
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
  }

  #   triggers = {
  #   always_run      = "${timestamp()}"
  # }
}
