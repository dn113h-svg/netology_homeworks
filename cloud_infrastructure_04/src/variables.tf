###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
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
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "container_registry_name" {
  type        = string
  default     = "cloud-infrastructure-04"
  description = "Yandex Container Registry name"
}

variable "container_repository_name" {
  type        = string
  default     = "web-app"
  description = "Container Repository name inside the registry"
}

variable "mysql_cluster_name" {
  type        = string
  default     = "web-app-mysql"
  description = "Managed MySQL cluster name"
}

variable "mysql_environment" {
  type        = string
  default     = "PRESTABLE"
  description = "Managed MySQL environment"
}

variable "mysql_version" {
  type        = string
  default     = "8.0"
  description = "Managed MySQL version"
}

variable "mysql_resource_preset_id" {
  type        = string
  default     = "s2.micro"
  description = "Managed MySQL resource preset"
}

variable "mysql_disk_type_id" {
  type        = string
  default     = "network-hdd"
  description = "Managed MySQL disk type"
}

variable "mysql_disk_size" {
  type        = number
  default     = 10
  description = "Managed MySQL disk size in GB"
}

variable "mysql_database_name" {
  type        = string
  default     = "virtd"
  description = "Application database name"
}

variable "mysql_user" {
  type        = string
  default     = "app"
  description = "Application database user"
}

variable "mysql_user_roles" {
  type        = list(string)
  default     = ["ALL"]
  description = "Application database user roles"
}

variable "mysql_password" {
  type        = string
  sensitive   = true
  description = "Application database password"
}
