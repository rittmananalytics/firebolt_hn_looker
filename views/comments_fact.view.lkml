# The name of this view in Looker is "Comments Fact"
view: comments_fact {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: Personal.comments_fact ;;
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

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: month {
    type: time
    timeframes: [
      raw,

      month,
      quarter
    ]
    sql: ${TABLE}.MONTH ;;
  }

  dimension: parent {
    type: number
    sql: ${TABLE}.parent ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.





  dimension: ranking {
    hidden: yes
    type: number
    sql: ${TABLE}.ranking ;;
  }

  measure: total_ranking_score {
    type: sum
    sql: ${ranking} ;;
  }

  dimension: story_id {
    type: number
    sql: ${TABLE}.story_id ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}."time" ;;
  }

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

  dimension_group: comment {
    type: time
    timeframes: [
      year
    ]
    sql: ${TABLE}.YEAR ;;
  }

  measure: total_comments {
    type: count_distinct
    sql: ${TABLE}.id ;;
    drill_fields: [id]
  }
}
