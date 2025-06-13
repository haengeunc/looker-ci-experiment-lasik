#Ensuring that a primary key is unique

test: order_id_is_unique {
  explore_source: order_items {
    column: order_id { field: orders.order_id }
    column: count { field: orders.count }
    # Sort and limit to quickly find potential duplicates
    # If the count is > 1 for any ID, the test will fail
    sorts: [orders.count: desc]
    limit: 1
  }
  assert: order_id_is_unique {
    expression: ${orders.count} = 1 ;;
  }
}
