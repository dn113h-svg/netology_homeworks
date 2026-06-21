output "mysql_host" {
  description = "Managed MySQL host FQDN for the web application"
  value       = yandex_mdb_mysql_cluster.mysql.host[0].fqdn
}

output "mysql_database" {
  description = "Application database name"
  value       = yandex_mdb_mysql_database.app.name
}

output "mysql_user" {
  description = "Application database user"
  value       = yandex_mdb_mysql_user.app.name
}

output "container_registry_id" {
  description = "Yandex Container Registry ID"
  value       = yandex_container_registry.my_registry.id
}

output "container_repository_name" {
  description = "Yandex Container Repository name"
  value       = yandex_container_repository.my_repository.name
}

output "vm_public_ip" {
  description = "Public IP address of the application VM"
  value       = yandex_compute_instance.example.network_interface[0].nat_ip_address
}