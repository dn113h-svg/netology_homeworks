locals {
    vm_name1 = "netology-${yandex_vpc_subnet.develop1.name}-${var.vm_web_zone}"
    vm_name2 = "netology-${yandex_vpc_subnet.develop2.name}-${var.vm_db_zone}"
}