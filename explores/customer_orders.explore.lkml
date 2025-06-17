include: "/staging_views/users.layer.lkml"
include: "/staging_views/order_items.layer.lkml"
include: "/staging_views/products.layer.lkml"
include: "/staging_views/orders.layer.lkml"



explore: customers_orders {
  label: "Customers & Orders"

  view_name: order_items

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

  join: fov_example {
    relationship: one_to_one
    sql: ;; # leave blank for bare joins
  }
}

#-----------------------------------------------------

view: fov_example {
  #field-only view i.e. no sql_table_name argument
  view_label: "Orders"

  measure: avg_orders_per_user{
    sql: ${orders.count} / ${users.count} ;;
    type: number
    value_format_name: decimal_2
  }
}
