resource "yandex_container_registry" "my_registry" {
  name = var.container_registry_name
}

resource "yandex_container_repository" "my_repository" {
  name = "${yandex_container_registry.my_registry.id}/${var.container_repository_name}"
}
