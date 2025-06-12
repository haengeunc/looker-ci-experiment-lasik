

include: "/_staging_views/users.layer.lkml"
include: "/_staging_views/order_items.layer.lkml"
include: "/_staging_views/products.layer.lkml"
include: "/views/orders.view.lkml"



explore: order_items {
  label: "Customers & Orders"
  # always_filter: {
  #   filters: [users.country: "Germany"]
  # }

  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

}
