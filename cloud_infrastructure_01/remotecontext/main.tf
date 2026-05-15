terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
  required_version = "~>1.15.0" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  host = "ssh://bars@51.250.17.208:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

#однострочный комментарий

resource "random_password" "random_string1" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "random_string2" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"
  
  
  env = ["MYSQL_ROOT_PASSWORD=example_${random_password.random_string1.result}", "MYSQL_PASSWORD=example_${random_password.random_string2.result}", "MYSQL_DATABASE=wordpress", "MYSQL_USER=wordpress", "MYSQL_ROOT_HOST=%"]
  ports {
    internal = 3306
    external = 3306
  }
}
