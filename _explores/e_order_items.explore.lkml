

include: "/_staging_views/customer_sales/users.layer.lkml"
include: "/_staging_views/customer_sales/order_items.layer.lkml"


include: "/_staging_views/fulfilment/products.layer.lkml"
include: "/_staging_views/fulfilment/inventory_items.layer.lkml"

include: "/views/products.view.lkml"
include: "/views/orders.view.lkml"
include: "/views/distribution_centers.view.lkml"


explore: order_items {
  # always_filter: {
  #   filters: [users.country: "Germany"]
  # }

  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
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

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}
