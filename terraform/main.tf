resource "null_resource" "k3d_cluster" {
  provisioner "local-exec" {
    command = "k3d cluster create ${var.cluster_name} --servers ${var.server_count} --agents ${var.agent_count} -p \"3000:3000@loadbalancer\" -p \"8080:80@loadbalancer\""
  }
}

resource "null_resource" "kubeconfig" {
  depends_on = [null_resource.k3d_cluster]

  provisioner "local-exec" {
    command = "kubectl config use-context k3d-${var.cluster_name}"
  }
}