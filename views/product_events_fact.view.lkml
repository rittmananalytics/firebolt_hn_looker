view: product_events_fact {
  sql_table_name: product_events_final;;


  measure: count_events {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [detail*]
  }

  measure: count_users {
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  dimension: anonymous_id {
    group_label: "User"

    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: context_app_build {
    group_label: "Context"
    group_item_label: "App Build"

    type: number
    sql: ${TABLE}.context_app_build ;;
  }

  dimension: context_app_name {
    group_label: "Context"
    group_item_label: "App Name"

    type: string
    sql: ${TABLE}.context_app_name ;;
  }

  dimension: context_app_namespace {
    group_label: "Context"
    group_item_label: "App Namespace"

    type: string
    sql: ${TABLE}.context_app_namespace ;;
  }

  dimension: context_app_version {
    group_label: "Context"
    group_item_label: "App Version"

    type: string
    sql: ${TABLE}.context_app_version ;;
  }

  dimension: context_device_id {
    group_label: "Context"
    group_item_label: "Device ID"

    type: string
    sql: ${TABLE}.context_device_id ;;
  }

  dimension: context_device_manufacturer {
    group_label: "Context"
    group_item_label: "Device Manufacturer"

    type: string
    sql: ${TABLE}.context_device_manufacturer ;;
  }

  dimension: context_device_model {
    group_label: "Context"
    group_item_label: "Device Model"

    type: string
    sql: ${TABLE}.context_device_model ;;
  }

  dimension: context_device_type {
    group_label: "Context"
    group_item_label: "Device Type"

    type: string
    sql: ${TABLE}.context_device_type ;;
  }

  dimension: context_ip {
    hidden: yes
    type: string
    sql: ${TABLE}.context_ip ;;
  }

  dimension: context_library_name {
    group_label: "Context"
    group_item_label: "Library Name"

    type: string
    sql: ${TABLE}.context_library_name ;;
  }

  dimension: context_library_version {
    group_label: "Context"
    group_item_label: "Library Version"

    type: string
    sql: ${TABLE}.context_library_version ;;
  }

  dimension: context_locale {
    group_label: "Context"
    group_item_label: "Locale"

    type: string
    sql: ${TABLE}.context_locale ;;
  }

  dimension: context_network_carrier {
    group_label: "Context"
    group_item_label: "Network Carrier"

    type: string
    sql: ${TABLE}.context_network_carrier ;;
  }

  dimension: context_network_cellular {
    group_label: "Context"
    group_item_label: "Network Cellular"

    type: string
    sql: ${TABLE}.context_network_cellular ;;
  }

  dimension: context_network_wifi {
    group_label: "Context"
    group_item_label: "Network WiFI"

    type: string
    sql: ${TABLE}.context_network_wifi ;;
  }

  dimension: context_os_name {
    group_label: "Context"
    group_item_label: "OS Name"

    type: string
    sql: ${TABLE}.context_os_name ;;
  }

  dimension: context_os_version {
    group_label: "Context"
    group_item_label: "OS Version"

    type: string
    sql: ${TABLE}.context_os_version ;;
  }

  dimension: context_screen_height {
    group_label: "Context"
    group_item_label: "Screen Height"

    type: number
    sql: ${TABLE}.context_screen_height ;;
  }

  dimension: context_screen_width {
    group_label: "Context"
    group_item_label: "Screen Width"
    type: number
    sql: ${TABLE}.context_screen_width ;;
  }

  dimension: context_timezone {
    group_label: "Context"
    group_item_label: "Timezone"
    type: string
    sql: ${TABLE}.context_timezone ;;
  }

  dimension: event {
    group_label: "Product Event"
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_text {
    group_label: "Product Event"

    type: string
    sql: ${TABLE}.event_text ;;
  }



  dimension: id {
    group_label: "Metadata"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: loaded_at {
    hidden: yes

    type: time
    sql: ${TABLE}.loaded_at ;;
  }

  dimension: user_event_index {
    type: number
    sql: ${TABLE}.user_event_index ;;
  }

  dimension: blended_user_id {
    group_label: "User"

    type: string
    sql: ${TABLE}.blended_user_id ;;
  }

  measure:  count_blended_users {
    type: count_distinct
    sql: ${blended_user_id} ;;
  }

  dimension_group: original_timestamp {
    hidden: yes

    type: time
    sql: ${TABLE}.original_timestamp ;;
  }

  dimension_group: received_at {
    label: "Event"
    hidden: no
    timeframes: [time,hour_of_day,hour6,time_of_day,date,day_of_week,day_of_week_index,day_of_year,week_of_year,week,month,month_name,month_num,quarter,quarter_of_year,year]

    type: time
    sql: ${TABLE}.received_at ;;
  }

  dimension_group: sent_at {
    hidden: yes
    type: time
    sql: ${TABLE}.sent_at ;;
  }

  dimension_group: timestamp {
    type: time
    hidden: yes
    timeframes: [time,hour_of_day,hour6,time_of_day,date,day_of_week,day_of_week_index,day_of_year,week_of_year,week,month,month_name,month_num,quarter,quarter_of_year,year]
    sql: ${TABLE}."TIMESTAMP" ;;
  }

  dimension: user_id {
    group_label: "User"

    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: uuid_ts {
    group_label: "Metadata"

    type: time
    sql: ${TABLE}.uuid_ts ;;
  }



  dimension: event_type_seq_1 {
    group_label: "Event Sequence"
    type: string
    sql: case when user_event_index = 1 then event_text end ;;
  }

  dimension: event_type_seq_2 {
    group_label: "Event Sequence"
    type: string
    sql: case when user_event_index = 2 then event_text end ;;
  }

  dimension: event_type_seq_3 {
    group_label: "Event Sequence"
    type: string
    sql: case when user_event_index = 3 then event_text end ;;
  }

  dimension: event_type_seq_4 {
    group_label: "Event Sequence"
    type: string
    sql: case when user_event_index = 4 then event_text end ;;
  }

  dimension: event_type_seq_5 {
    group_label: "Event Sequence"
    type: string
    sql: case when user_event_index = 5 then event_text end ;;
  }

  measure: event_name {
    type: string
    sql: ${TABLE}.event_text ;;
  }





  set: detail {
    fields: [
      anonymous_id,
      context_app_build,
      context_app_name,
      context_app_namespace,
      context_app_version,
      context_device_id,
      context_device_manufacturer,
      context_device_model,
      context_device_type,
      context_ip,
      context_library_name,
      context_library_version,
      context_locale,
      context_network_carrier,
      context_network_cellular,
      context_network_wifi,
      context_os_name,
      context_os_version,
      context_screen_height,
      context_screen_width,
      context_timezone,
      event,
      event_text,
      id,
      loaded_at_time,
      original_timestamp_time,
      received_at_time,
      sent_at_time,
      timestamp_time,
      user_id,
      uuid_ts_time
    ]
  }
}
