# The name of this view in Looker is "Hacker News All"
view: hacker_news_all {

  sql_table_name: Personal.hacker_news_all;;

  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    hidden: yes

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



  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: posted {
    type: time
    timeframes: [

      month,
      quarter,
      year
    ]
    sql: ${TABLE}.MONTH ;;
  }

  dimension: parent {
    type: number
    sql: ${TABLE}.parent ;;
  }

  dimension: ranking {
    hidden: yes
    type: number
    sql: ${TABLE}.ranking ;;
  }

  measure: average_ranking {
    type: average
    sql: ${ranking} ;;
  }



  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  measure: total_score {
    type: sum
    sql: ${score} ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }




  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count_stories {
    type: count_distinct
    sql: ${id} ;;
    filters: [type: "story"]
  }

  measure: count_comments {
    type: count_distinct
    sql: ${id} ;;
    filters: [type: "comment"]
  }

  measure: count_polls {
    type: count_distinct
    sql: ${id} ;;
    filters: [type: "poll"]
  }

  measure: count_jobs {
    type: count_distinct
    sql: ${id} ;;
    filters: [type: "job"]
  }
}
