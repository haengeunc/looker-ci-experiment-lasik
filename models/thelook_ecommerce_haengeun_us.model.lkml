
# Define the database connection to be used for this model.
connection: "haengeun_bq"

# include all the views
include: "/explores/*.lkml"
include: "/data_tests/*.lkml"


label: "Haengeun E-commerce"


datagroup: thelook_ecommerce_haengeun_us_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: thelook_ecommerce_haengeun_us_default_datagroup
