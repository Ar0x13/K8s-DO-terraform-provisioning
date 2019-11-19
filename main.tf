provider "digitalocean" {
  token = file("~/.ssh/do_token")
}

#----------------------------------------------------------------
# K8s cluster
#----------------------------------------------------------------
resource "digitalocean_kubernetes_cluster" "k8s-test" {
  name    = "${var.cluster_name}"
  region  = "${var.cluster_region}"
  version = "${var.k8s_version}"

  node_pool {
    name       = "${var.cluster_name}-workers"
    size       = "${var.worker_type}"
    node_count = "${var.worker_count}"

    tags = [
      "k8s-test-nodes"
    ]
  }
}
#----------------------------------------------------------------
# Use public ssh key created created in UI
#----------------------------------------------------------------

data "digitalocean_ssh_key" "private-ssh-key" {
  name = "home_key"
}

#----------------------------------------------------------------
# Docker Registry instance
#----------------------------------------------------------------
# resource "digitalocean_droplet" "docker-registry" {
#    image  = "centos-7-x64"
#    name   = "docker-registry-1"
#    region = "${var.cluster_region}"
#    size   = "s-1vcpu-2gb"
#    ssh_keys = [data.digitalocean_ssh_key.private-ssh-key.id]
# }