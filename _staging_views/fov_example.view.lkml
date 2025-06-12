view: fov_example {

    measure: avg_orders_per_user{
      sql: ${orders.count} / ${users.count} ;;
      type: number
    }

  }
