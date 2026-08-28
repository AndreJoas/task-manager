output "cluster_name" {
  description = "Nome do cluster k3d criado"
  value       = k3d_cluster.task_manager.name
}