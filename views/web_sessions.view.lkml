# The name of this view in Looker is "Web Sessions"
view: web_sessions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: Personal.web_sessions ;;
  drill_fields: [web_sessions_pk]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: web_sessions_pk {
    primary_key: yes
    type: string
    sql: ${TABLE}.web_sessions_pk ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Airbyte Ab ID" in Explore.

  dimension: _airbyte_ab_id {
    type: string
    hidden: yes
    sql: ${TABLE}._airbyte_ab_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _airbyte_emitted {
    type: time
    hidden: yes

    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._airbyte_emitted_at ;;
  }

  dimension: ad_campaign_pk {
    hidden: yes

    type: string
    sql: ${TABLE}.ad_campaign_pk ;;
  }

  dimension: blended_user_id {
    type: string
    sql: ${TABLE}.blended_user_id ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: duration_in_s {
    type: number
    sql: cast(${TABLE}.duration_in_s as int);;
  }

  dimension: duration_in_s_tier {
    type: string
    sql: ${TABLE}.duration_in_s_tier ;;
  }

  dimension: events {
    type: string
    sql: cast(${TABLE}.events as int);;
  }

  dimension: first_page_url {
    type: string
    sql: ${TABLE}.first_page_url ;;
  }

  dimension: first_page_url_host {
    type: string
    sql: ${TABLE}.first_page_url_host ;;
  }

  dimension: first_page_url_path {
    type: string
    sql: ${TABLE}.first_page_url_path ;;
  }

  dimension: gclid {
    hidden: yes
    type: string
    sql: ${TABLE}.gclid ;;
  }

  dimension: is_bounced_session {
    type: string
    sql: ${TABLE}.is_bounced_session ;;
  }

  dimension: last_page_url {
    type: string
    sql: ${TABLE}.last_page_url ;;
  }

  dimension: last_page_url_host {
    type: string
    sql: ${TABLE}.last_page_url_host ;;
  }

  dimension: last_page_url_path {
    type: string
    sql: ${TABLE}.last_page_url_path ;;
  }

  dimension: mins_between_sessions {
    type: string
    sql: ${TABLE}.mins_between_sessions ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: referrer_host {
    type: string
    sql: ${TABLE}.referrer_host ;;
  }

  dimension: referrer_medium {
    type: string
    sql: ${TABLE}.referrer_medium ;;
  }

  dimension: referrer_source {
    type: string
    sql: ${TABLE}.referrer_source ;;
  }

  dimension: search {
    type: string
    sql: ${TABLE}.search ;;
  }

  dimension_group: session_end_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.session_end_ts ;;
  }

  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: session_start_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.session_start_ts ;;
  }

  dimension: user_session_number {
    type: number
    sql: cast(${TABLE}.user_session_number as int) ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_content {
    type: string
    sql: ${TABLE}.utm_content ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
  }

  measure: count_sessions {
    type: count_distinct
    sql: ${web_sessions_pk} ;;
    drill_fields: [web_sessions_pk]
  }
}
