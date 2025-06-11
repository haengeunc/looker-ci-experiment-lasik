#Ensuring that a primary key is unique

test: order_id_is_unique {
  explore_source: orders {
    column: id {}
    column: count {
      field: orders.id # Assuming 'id' is the primary key in your orders view
    }
    # Sort and limit to quickly find potential duplicates
    # If the count is > 1 for any ID, the test will fail
    sorts: [orders.count: desc]
    limit: 1
  }
  assert: order_id_is_unique {
    expression: ${orders.count} = 1 ;;
  }
}
