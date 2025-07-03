
# Define the database connection to be used for this model.
connection: "haengeun_bq"

# include all the views
include: "/explores/*.lkml"
include: "/data_tests/*.lkml"
include: "/dashboards/*.dashboard"


label: "Haengeun E-commerce"


datagroup: thelook_ecommerce_haengeun_us_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: ecommerce_etl {
  sql_trigger: SELECT max(created_at) FROM thelook_ecommerce_haengeun_us.events ;;
  max_cache_age: "24 hours"
}

persist_with: thelook_ecommerce_haengeun_us_default_datagroup
