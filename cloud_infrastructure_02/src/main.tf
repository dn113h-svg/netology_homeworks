data "yandex_compute_image" "ubuntu" {
  family = var.vm_db_family
}

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop1" {
  name           = var.vm_web_sn_name
  zone           = var.vm_web_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_cidr
}

resource "yandex_compute_instance" "platform1" {
  name        = local.vm_name1
  platform_id = var.vm_web_platform_id
  zone           = var.vm_web_zone
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop1.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }

}


resource "yandex_vpc_subnet" "develop2" {
  name           = var.vm_db_sn_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
}


resource "yandex_compute_instance" "platform2" {
  name        = local.vm_name2
  platform_id = var.vm_db_platform_id
  zone           = var.vm_db_zone

  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop2.id
    nat       = var.vm_db_nat
  }

  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }

}