variable "config_entry_service_routers" {
  description = <<EOT
Map of config_entry_service_routers, attributes below
Required:
    - name
Optional:
    - meta
    - namespace
    - partition
    - routes (block):
        - destination (optional, block):
            - idle_timeout (optional)
            - namespace (optional)
            - num_retries (optional)
            - partition (optional)
            - prefix_rewrite (optional)
            - request_headers (optional, block):
                - add (optional)
                - remove (optional)
                - set (optional)
            - request_timeout (optional)
            - response_headers (optional, block):
                - add (optional)
                - remove (optional)
                - set (optional)
            - retry_on (optional)
            - retry_on_connect_failure (optional)
            - retry_on_status_codes (optional)
            - service (optional)
            - service_subset (optional)
        - match (optional, block):
            - http (optional, block):
                - header (optional, block):
                    - exact (optional)
                    - invert (optional)
                    - name (optional)
                    - prefix (optional)
                    - present (optional)
                    - regex (optional)
                    - suffix (optional)
                - methods (optional)
                - path_exact (optional)
                - path_prefix (optional)
                - path_regex (optional)
                - query_param (optional, block):
                    - exact (optional)
                    - name (optional)
                    - present (optional)
                    - regex (optional)
EOT

  type = map(object({
    name      = string
    meta      = optional(map(string))
    namespace = optional(string)
    partition = optional(string)
    routes = optional(list(object({
      destination = optional(object({
        idle_timeout   = optional(string)
        namespace      = optional(string)
        num_retries    = optional(number)
        partition      = optional(string)
        prefix_rewrite = optional(string)
        request_headers = optional(object({
          add    = optional(map(string))
          remove = optional(list(string))
          set    = optional(map(string))
        }))
        request_timeout = optional(string)
        response_headers = optional(object({
          add    = optional(map(string))
          remove = optional(list(string))
          set    = optional(map(string))
        }))
        retry_on                 = optional(list(string))
        retry_on_connect_failure = optional(bool)
        retry_on_status_codes    = optional(list(number))
        service                  = optional(string)
        service_subset           = optional(string)
      }))
      match = optional(object({
        http = optional(object({
          header = optional(list(object({
            exact   = optional(string)
            invert  = optional(bool)
            name    = optional(string)
            prefix  = optional(string)
            present = optional(bool)
            regex   = optional(string)
            suffix  = optional(string)
          })))
          methods     = optional(list(string))
          path_exact  = optional(string)
          path_prefix = optional(string)
          path_regex  = optional(string)
          query_param = optional(list(object({
            exact   = optional(string)
            name    = optional(string)
            present = optional(bool)
            regex   = optional(string)
          })))
        }))
      }))
    })))
  }))
}

