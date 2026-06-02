variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 1
      disk_volume = 10
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 1
      disk_volume = 10
    }
  ]
}

locals {
  db_servers = {
    for vm in var.each_vm :
    vm.vm_name => {
      cpu         = vm.cpu
      ram         = vm.ram
      disk_volume = vm.disk_volume
    }
  }
}

resource "yandex_compute_instance" "database" {
  for_each = local.db_servers
  
  name        = each.key
  platform_id = "standard-v3"
  zone        = "ru-central1-a"
  
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = 20
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = 10
    }
  }

  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  
  metadata = {
    ssh-keys = "ubuntu:${local.ssh_metadata_key}"
  }
}