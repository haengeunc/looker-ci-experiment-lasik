include: "/views/order_items.view.lkml"

view: +order_items {

  dimension_group: created {
    timeframes: [raw, time, date, week, month, month_name, quarter, year]
  }

  dimension: status {
    html: {% if value == 'Shipped' or value == 'Complete' %}
      <p>✅ {{value}}</p>
    {% elsif value == 'Processing' %}
      <p>⏳ {{value}}</p>
    {% else %}
      <p>❌ {{value}}</p>
    {% endif %}
   ;;
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
    value_format:"[>=1000]$#,##0,\"K\";[<1000]$#,##0"
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
  }

  measure: first_order {
    type: date
    sql: MIN(${created_date}) ;;
  }

  measure: latest_order {
    type: date
    sql: MAX(${created_date}) ;;
  }

}
