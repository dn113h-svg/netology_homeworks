output "instance_name1" {
  value       = yandex_compute_instance.platform1.id
}

output "instance_name2" {
  value       = yandex_compute_instance.platform2.id
}

output "external_ip1" {
  value       = yandex_compute_instance.platform1.network_interface[0].nat_ip_address
}
output "external_ip2" {
  value       = yandex_compute_instance.platform2.network_interface[0].nat_ip_address
}
output "fqdn1" {
  value       = yandex_compute_instance.platform1.fqdn
}
output "fqdn2" {
  value       = yandex_compute_instance.platform2.fqdn
}