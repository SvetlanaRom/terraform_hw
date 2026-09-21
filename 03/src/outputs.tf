output "vms_info" {
    value = concat(
        [for web in yandex_compute_instance.vm_web : {
            name = web.name
            id  = web.id
            fqdn = web.fqdn
        }],
        [for db in yandex_compute_instance.vm_db : {
            name = db.name
            id  = db.id
            fqdn = db.fqdn
        }])
}