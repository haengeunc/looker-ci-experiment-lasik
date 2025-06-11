include: "/views/users.view.lkml"


view: +users {
  label: "Users"

  dimension: full_name {
    type: string
    sql: CONCAT( ${first_name}, ' ', ${last_name}) ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;  }





}
