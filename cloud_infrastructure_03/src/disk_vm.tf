resource "yandex_compute_disk" "extra_disk" {
  count = 3
  
  name     = "disk-${count.index + 1}"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = 1
}


resource "yandex_compute_instance" "storage" {

  name        = "storage"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"
  
  resources {
    cores         = 2
    memory        = 1
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


  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.extra_disk
    
    content {
      disk_id     = secondary_disk.value.id
      device_name = "sd${secondary_disk.key}"
      mode        = "READ_WRITE"
    }
  }
}