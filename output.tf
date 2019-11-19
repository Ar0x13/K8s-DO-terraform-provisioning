output "cluster-id" {
  value = "${digitalocean_kubernetes_cluster.k8s-test.id}"
}

output "kube_config" {
  value = "${digitalocean_kubernetes_cluster.k8s-test.kube_config.0.raw_config}"
}

# Export the kubectl configuration file
resource "local_file" "kubernetes_config" {
  content              = "${digitalocean_kubernetes_cluster.k8s-test.kube_config.0.raw_config}"
  filename             = "/Users/adm1n/.kube/config"
  file_permission      = "0644"
  directory_permission = "0755"
}