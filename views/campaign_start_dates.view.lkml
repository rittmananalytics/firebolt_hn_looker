view: campaign_start_dates {
  derived_table: {
    sql: SELECT
          "web_sessions"."utm_source" as utm_source,
          "web_sessions"."utm_campaign" AS utm_campaign,

      min("web_events_fact"."event_ts") AS first_event_ts_date
      FROM
      "Personal"."web_sessions" AS "web_sessions"
      INNER JOIN "Personal"."web_events_fact" AS "web_events_fact" ON "web_sessions"."web_sessions_pk" = "web_events_fact"."web_sessions_pk"
      WHERE
      "web_sessions"."utm_source" in ('facebook','linkedin','hs_email','twitter','adwords','newsletter','podcast')

      GROUP BY
      1,2
      ;;
  }


  dimension: utm_source {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_campaign {
    hidden: yes

    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension_group: first_event_ts {
    type: time
    timeframes: [date,raw]
    sql: ${TABLE}.first_event_ts_date ;;
  }


}
