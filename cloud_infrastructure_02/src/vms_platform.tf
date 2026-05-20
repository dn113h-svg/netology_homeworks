

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform_id"
}

/*
variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "cores"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "memory"
}

variable "vm_web_core_fractions" {
  type        = number
  default     = 20
  description = "core_fraction"
}
*/

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "preemptible"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "nat"
}

/*
variable "vm_web_serial-port-enable" {
  type        = number
  default     = 1
  description = "serial-port-enable"
}
*/

variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "zone"
}

variable "vm_web_sn_name" {
  type        = string
  default     = "develop1"
  description = "Subnet name"
}
variable "vm_web_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


###vm_db

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform_id"
}

/*
variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "cores"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "memory"
}

variable "vm_db_core_fractions" {
  type        = number
  default     = 20
  description = "core_fraction"
}
*/

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "preemptible"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "nat"
}

/*
variable "vm_db_serial-port-enable" {
  type        = number
  default     = 1
  description = "serial-port-enable"
}
*/

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "zone"
}

variable "vm_db_sn_name" {
  type        = string
  default     = "develop2"
  description = "Subnet name"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

### Common 

variable "vms_resources" {
  type = map(object(
  {
    cores=number
    memory=number
    core_fraction=number
  }))
  default = {
    "web"={
      cores=2
      memory=1
      core_fraction=20
    }
    "db"= {
      cores=2
      memory=2
      core_fraction=20
    }
  }
}

variable "metadata" {
  type = object(
  {
    serial-port-enable = number
    ssh-keys   = string
  })
  default = {
    serial-port-enable = 1
    ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIESuS2IAOiRED6jT8AjBMGIS9yvYfvBubpGVkLFl57v4 dn113h@gmail.com"
  }
}