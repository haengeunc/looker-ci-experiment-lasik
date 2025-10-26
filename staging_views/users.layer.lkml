include: "/views/users.view.lkml"


view: +users {
  label: "Users"

  dimension: id {
    label: "User ID"
    group_label: "User Details"
  }

  dimension: full_name {
    type: string
    sql: CONCAT( ${first_name}, ' ', ${last_name}) ;;
    group_label: "User Details"
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
