connection: "firebolt_ra"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: web_sessions {
  label: "Sessions"
  view_label: "Sessions"
  join: web_events_fact {
    sql_on: ${web_sessions.web_sessions_pk} = ${web_events_fact.web_sessions_pk} ;;
    type: inner
    relationship: one_to_many
  }
  join: campaign_start_dates {
    view_label: "Sessions"
    sql_on: ${web_sessions.utm_campaign} = ${campaign_start_dates.utm_campaign} ;;
    type: left_outer
    relationship: one_to_one
  }
}
