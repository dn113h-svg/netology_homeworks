###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1g7loj7hufso6hn5io1"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g9k2q13k5lfama38tj"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop1"
  description = "VPC network & subnet name"
}


###ssh vars

/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIESuS2IAOiRED6jT8AjBMGIS9yvYfvBubpGVkLFl57v4 dn113h@gmail.com"
  description = "ssh-keygen -t ed25519"
}
*/


variable "test" {
  type = list(map(list(string)))
}