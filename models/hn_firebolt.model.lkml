# Define the database connection to be used for this model.
connection: "firebolt_ra"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: hn_firebolt_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hn_firebolt_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Hn Firebolt"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: comments_fact {
  label: "Comments & Stories"
  view_label: "Comments"
  join: stories_dim{
    view_label: "Stories"
    sql_on: ${comments_fact.story_id} = ${stories_dim.id} ;;
    type: inner
    relationship: many_to_one
  }
}
explore: authors {
  from: comments_fact
  view_label: "Authors"
  join: stories_dim {
    view_label: "Stories"
    sql_on: ${authors.author} = ${stories_dim.author} ;;
    type: inner
    relationship: many_to_one
  }
}
explore: hacker_news_all {
  always_filter: { filters: [type: "story,comment", hacker_news_all.posted_month: "12 months"]}
  view_label: "Hacker News"
  label: "Hacker News"
}
