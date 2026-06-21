resource "yandex_mdb_mysql_cluster" "mysql" {
  name                = var.mysql_cluster_name
  environment         = var.mysql_environment
  network_id          = yandex_vpc_network.develop.id
  security_group_ids  = [yandex_vpc_security_group.example.id]
  version             = var.mysql_version
  deletion_protection = false

  resources {
    resource_preset_id = var.mysql_resource_preset_id
    disk_type_id       = var.mysql_disk_type_id
    disk_size          = var.mysql_disk_size
  }

  host {
    zone      = var.default_zone
    subnet_id = yandex_vpc_subnet.develop.id
  }
}

resource "yandex_mdb_mysql_database" "app" {
  cluster_id = yandex_mdb_mysql_cluster.mysql.id
  name       = var.mysql_database_name
}

resource "yandex_mdb_mysql_user" "app" {
  cluster_id = yandex_mdb_mysql_cluster.mysql.id
  name       = var.mysql_user
  password   = var.mysql_password

  permission {
    database_name = yandex_mdb_mysql_database.app.name
    roles         = var.mysql_user_roles
  }
}
