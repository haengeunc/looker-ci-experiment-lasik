view: fov_example {

  #field-only view i.e. no sql_table_name argument

    measure: avg_orders_per_user{
      sql: ${orders.count} / ${users.count} ;;
      type: number
    }

  }
