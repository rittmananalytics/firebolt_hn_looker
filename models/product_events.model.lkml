connection: "firebolt_ra"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: product_events_fact {}
