connection: "ra_dw_prod"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/dashboards/*.*.*"

explore: hacker_news_all {
  from: bq_hacker_news_full
  always_filter: { filters: [type: "story,comment", hacker_news_all.posted_month: "12 months"]}
  view_label: "Hacker News"
  label: "Hacker News"
}
