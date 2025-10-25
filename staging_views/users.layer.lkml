include: "/views/users.view.lkml"


view: +users {
  label: "Users"

  dimension: full_name {
    type: string
    sql: CONCAT( ${first_name}, ' ', ${last_name}) ;;
  }

  dimension: country {
    drill_fields: [state, city]
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
    value_format_name: decimal_2
  }

}
