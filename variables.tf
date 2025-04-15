variable "prefix" {
  type        = string
  default     = "demo"
  description = "Prefix for resource names"
}

variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  type        = string
  default     = "monitoring"
  description = "Azure Resource Group"
}

variable "prometheus_port" {
  type = string
  default = 9090
  description = "Prometheus target port"
}

variable "grafana_port" {
  type = string
  default = 3000
  description = "Grafana target port"
}