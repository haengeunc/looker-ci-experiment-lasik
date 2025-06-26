include: "/views/products.view.lkml"

view: +products {

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    link: {
      label: "Google"
      url: "https://www.google.com/search?q={{ value }}"
      icon_url: "https://google.com/favicon.ico"
    }

    # suggestions: ["Nike", "Speedo", "PUMA", "adidas", "Lee", "error"]
    suggest_explore: fulfillme
    suggest_dimension: inventory_items.product_catego

  }

}
