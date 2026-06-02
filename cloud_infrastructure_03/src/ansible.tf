resource "local_file" "inventory_templatefile" {
  content = templatefile("${path.module}/inventory.tftpl",

  { webservers = yandex_compute_instance.example, databases = yandex_compute_instance.database, storage = yandex_compute_instance.storage })

  filename = "${abspath(path.module)}/inventory.ini"
}
