output "config_entry_service_routers_id" {
  description = "Map of id values across all config_entry_service_routers, keyed the same as var.config_entry_service_routers except keys with no id are omitted"
  value       = { for k, v in consul_config_entry_service_router.config_entry_service_routers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "config_entry_service_routers_meta" {
  description = "Map of meta values across all config_entry_service_routers, keyed the same as var.config_entry_service_routers except keys with no meta are omitted"
  value       = { for k, v in consul_config_entry_service_router.config_entry_service_routers : k => v.meta if v.meta != null && length(v.meta) > 0 }
}
output "config_entry_service_routers_name" {
  description = "Map of name values across all config_entry_service_routers, keyed the same as var.config_entry_service_routers except keys with no name are omitted"
  value       = { for k, v in consul_config_entry_service_router.config_entry_service_routers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "config_entry_service_routers_namespace" {
  description = "Map of namespace values across all config_entry_service_routers, keyed the same as var.config_entry_service_routers except keys with no namespace are omitted"
  value       = { for k, v in consul_config_entry_service_router.config_entry_service_routers : k => v.namespace if v.namespace != null && length(v.namespace) > 0 }
}
output "config_entry_service_routers_partition" {
  description = "Map of partition values across all config_entry_service_routers, keyed the same as var.config_entry_service_routers except keys with no partition are omitted"
  value       = { for k, v in consul_config_entry_service_router.config_entry_service_routers : k => v.partition if v.partition != null && length(v.partition) > 0 }
}
output "config_entry_service_routers_routes" {
  description = "Map of routes values across all config_entry_service_routers, keyed the same as var.config_entry_service_routers except keys with no routes are omitted"
  value       = { for k, v in consul_config_entry_service_router.config_entry_service_routers : k => v.routes if v.routes != null && length(v.routes) > 0 }
}

