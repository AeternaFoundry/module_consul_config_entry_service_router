resource "consul_config_entry_service_router" "config_entry_service_routers" {
  for_each = var.config_entry_service_routers

  name      = each.value.name
  meta      = each.value.meta
  namespace = each.value.namespace
  partition = each.value.partition

  dynamic "routes" {
    for_each = each.value.routes != null ? each.value.routes : []
    content {
      dynamic "destination" {
        for_each = routes.value.destination != null ? [routes.value.destination] : []
        content {
          idle_timeout   = destination.value.idle_timeout
          namespace      = destination.value.namespace
          num_retries    = destination.value.num_retries
          partition      = destination.value.partition
          prefix_rewrite = destination.value.prefix_rewrite
          dynamic "request_headers" {
            for_each = destination.value.request_headers != null ? [destination.value.request_headers] : []
            content {
              add    = request_headers.value.add
              remove = request_headers.value.remove
              set    = request_headers.value.set
            }
          }
          request_timeout = destination.value.request_timeout
          dynamic "response_headers" {
            for_each = destination.value.response_headers != null ? [destination.value.response_headers] : []
            content {
              add    = response_headers.value.add
              remove = response_headers.value.remove
              set    = response_headers.value.set
            }
          }
          retry_on                 = destination.value.retry_on
          retry_on_connect_failure = destination.value.retry_on_connect_failure
          retry_on_status_codes    = destination.value.retry_on_status_codes
          service                  = destination.value.service
          service_subset           = destination.value.service_subset
        }
      }
      dynamic "match" {
        for_each = routes.value.match != null ? [routes.value.match] : []
        content {
          dynamic "http" {
            for_each = match.value.http != null ? [match.value.http] : []
            content {
              dynamic "header" {
                for_each = http.value.header != null ? http.value.header : []
                content {
                  exact   = header.value.exact
                  invert  = header.value.invert
                  name    = header.value.name
                  prefix  = header.value.prefix
                  present = header.value.present
                  regex   = header.value.regex
                  suffix  = header.value.suffix
                }
              }
              methods     = http.value.methods
              path_exact  = http.value.path_exact
              path_prefix = http.value.path_prefix
              path_regex  = http.value.path_regex
              dynamic "query_param" {
                for_each = http.value.query_param != null ? http.value.query_param : []
                content {
                  exact   = query_param.value.exact
                  name    = query_param.value.name
                  present = query_param.value.present
                  regex   = query_param.value.regex
                }
              }
            }
          }
        }
      }
    }
  }
}

