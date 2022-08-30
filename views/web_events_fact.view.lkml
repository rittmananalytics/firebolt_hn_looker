# The name of this view in Looker is "Web Events Fact"
view: web_events_fact {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: Personal.web_events_fact ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ad Campaign Pk" in Explore.

  dimension: ad_campaign_pk {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_campaign_pk ;;
  }

  parameter: campaign_metric {
    allowed_value: {label: "Unique Users" value: "blended_user_id"}
    allowed_value: {label: "Page Events" value: "web_event_pk"}
    allowed_value: {label: "Conversions" value: "conversions"}
    allowed_value: {label: "Visit Value" value: "total_visit_value"}
    default_value: "total_visit_value"
  }

  dimension: blended_user_id {
    hidden: yes

    type: string
    sql: ${TABLE}.blended_user_id ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: event_details {
    type: string
    sql: ${TABLE}.event_details ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: event_in_session_seq {
    type: number
    sql: ${TABLE}.event_in_session_seq ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_event_in_session_seq {
    type: sum
    sql: ${event_in_session_seq} ;;
  }



  dimension: event_number {
    type: number
    sql: ${TABLE}.event_number ;;
  }

  dimension: event_seq {
    type: number
    sql: ${TABLE}.event_seq ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_ts {
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
    sql: ${TABLE}.event_ts ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: gclid {
    hidden: yes
    type: string
    sql: ${TABLE}.gclid ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: page_url_host {
    type: string
    sql: ${TABLE}.page_url_host ;;
  }

  dimension: page_url_path {
    type: string
    sql: ${TABLE}.page_url_path ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: referrer_host {
    type: string
    sql: ${TABLE}.referrer_host ;;
  }

  dimension: search {
    type: string
    sql: ${TABLE}.search ;;
  }

  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: time_on_page_secs {
    type: number
    sql: ${TABLE}.time_on_page_secs ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
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

  dimension: visitor_id {
    type: string
    sql: ${TABLE}.visitor_id ;;
  }

  dimension: web_event_pk {
    hidden: yes
    type: string
    sql: ${TABLE}.web_event_pk ;;
  }

  dimension: web_sessions_pk {
    hidden: yes
    type: string
    sql: ${TABLE}.web_sessions_pk ;;
  }

  dimension: days_since_campaign_start {
    type: number
    sql: DATE_DIFF('DAY', ${campaign_start_dates.first_event_ts_raw}, ${event_ts_raw}) ;;
  }

  dimension: page_category {
    type: string
    sql: case when ${event_type} = 'Page View' then
              case when ${TABLE}.page_url_path like '%blog%' then 'Blog'
                  when ${TABLE}.page_url_path like '%drilltodetail%' or ${TABLE}.page_url_path like '%podcast%' then 'Podcast'
                  when ${TABLE}.page_url_path = '/' or ${TABLE}.page_url_path like '%home-index%' then 'Home Page'
                  when ${TABLE}.page_url_path is not null then 'Marketing' end
              end;;
  }

  dimension: visit_value {
    type: number
    hidden: yes
    sql: case when ${page_category} = 'Blog' then 1 when ${page_category} = 'Home Page' then 2 when ${page_category} = 'Marketing' then 4
              when (lower(${event_type}) like '%collateral%' or lower(${event_type}) like '%pricing%') then 8
              when lower(${event_type}) like '%button%' then 16 end;;
  }

  dimension: is_conversion_event {
    type: yesno
    sql: ${event_type} like '%Button%' ;;
  }


  measure: total_conversions {
    type: count_distinct
    sql: ${web_event_pk} ;;
    filters: [is_conversion_event: "Yes"]
  }

  measure: total_visitor_value {
    type: sum
    sql: ${visit_value};;
  }

  measure: count_events {
    type: count_distinct
    sql: ${web_event_pk} ;;
    drill_fields: []
  }
}
