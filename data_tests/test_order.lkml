#Ensuring that a primary key is unique

test: order_id_is_unique {
  explore_source: customer_orders {
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


test: users_age_should_be_in_expected_range {
  explore_source: customer_orders {
    column: age {
      field: users.age
    }
  }
  assert: age_should_be_greater_than_zero {
    expression: ${users.age} > 10 ;;
  }
  assert: age_should_be_less_than_130 {
    expression: ${users.age} < 130 ;;
  }
}
