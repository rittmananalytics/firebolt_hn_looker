view: event_index {
  derived_table: {
    sql: SELECT
          product_events_fact.id  AS "product_events_fact.id",
          row_number() over (partition by product_events_fact.anonymous_id order by product_events_fact.received_at) as event_index
      FROM public.product_events_fact AS product_events_fact


      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product_events_fact_id {
    type: string
    sql: ${TABLE}."product_events_fact.id" ;;
  }

  dimension: event_index {
    type: number
    sql: ${TABLE}.event_index ;;
  }

  set: detail {
    fields: [product_events_fact_id, event_index]
  }
}
