variable "cluster_name" {
  type        = string
  description = "Unique cluster name (prepended to dns_zone)"
  default     = "k8s-test"
}
variable "k8s_version" {
  description = "Kubernetes version (1.16.2-do.0, 1.15.5-do.1)"
  default     = "1.16.2-do.0"
}
variable "cluster_region" {
  type        = string
  description = "Digital Ocean region (e.g. nyc1, sfo2, fra1, tor1)"
  default     = "fra1"
}

variable "worker_count" {
  type        = number
  description = "Number of workers"
  default     = 2
}

variable "worker_type" {
  type        = string
  description = "Droplet type for workers (e.g. s-1vcpu-2gb, s-2vcpu-2gb)"
  default     = "s-1vcpu-2gb"
}