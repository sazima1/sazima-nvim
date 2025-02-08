; extends

(block_mapping_pair
  key: (flow_node) @key (#eq? @key "cmd")
  (block_node
    (block_scalar) @injection.content (#set! injection.language "bash"))
)

(block_mapping_pair
  key: (flow_node) @key (#eq? @key "cmd")
  (flow_node
    (plain_scalar
      (string_scalar) @injection.content (#set! injection.language "bash")))
)

(block_mapping_pair
  key: (flow_node) @key (#eq? @key "restart")
  (block_node
    (block_scalar) @injection.content (#set! injection.language "bash"))
)

(block_mapping_pair
  key: (flow_node) @key (#eq? @key "restart")
  (flow_node
    (plain_scalar
      (string_scalar) @injection.content (#set! injection.language "bash")))
)
