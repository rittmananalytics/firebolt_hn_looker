# The name of this view in Looker is "Stories Dim"
view: stories_dim {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: Personal.stories_dim ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Author" in Explore.

  dimension: author {
    type: string
    sql: ${TABLE}.author ;;
  }

  dimension: by {
    type: string
    sql: ${TABLE}.BY ;;
  }

  dimension: dead {
    type: string
    sql: ${TABLE}.dead ;;
  }

  dimension: deleted {
    type: string
    sql: ${TABLE}.deleted ;;
  }

  dimension: descendants {
    type: number
    sql: ${TABLE}.descendants ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_descendants {
    type: sum
    sql: ${descendants} ;;
  }

  measure: average_descendants {
    type: average
    sql: ${descendants} ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}."time" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: time_ts {
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
    sql: ${TABLE}.time_ts ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
