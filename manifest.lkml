project_name: "haengeun_bq"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }


remote_dependency: haengeun_ci {
  url: "https://github.com/haengeunc/looker-ci-experiment-lasik"
  ref: "master"
}
