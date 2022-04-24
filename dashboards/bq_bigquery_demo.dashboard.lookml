- dashboard: bq_bigquery_demo
  title: HN BigQuery Demo
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Content by Month
    name: Content by Month
    model: hn_bigquery
    explore: hacker_news_all
    type: looker_column
    fields: [hacker_news_all.posted_month, hacker_news_all.count_stories, hacker_news_all.count_comments,
      hacker_news_all.count_polls, hacker_news_all.count_jobs]
    fill_fields: [hacker_news_all.posted_month]
    filters: {}
    sorts: [hacker_news_all.posted_month]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Type: hacker_news_all.type
      Posted Month: hacker_news_all.posted_month
      Title: hacker_news_all.title
    row: 3
    col: 16
    width: 8
    height: 8
  - title: Top Authors
    name: Top Authors
    model: hn_bigquery
    explore: hacker_news_all
    type: looker_bar
    fields: [hacker_news_all.author, hacker_news_all.total_score]
    filters: {}
    sorts: [hacker_news_all.total_score desc]
    limit: 20
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Type: hacker_news_all.type
      Posted Month: hacker_news_all.posted_month
      Title: hacker_news_all.title
    row: 3
    col: 0
    width: 8
    height: 8
  - title: Post Types
    name: Post Types
    model: hn_bigquery
    explore: hacker_news_all
    type: looker_line
    fields: [hacker_news_all.type, hacker_news_all.count_stories, hacker_news_all.count_comments,
      hacker_news_all.count_jobs, hacker_news_all.count_polls, hacker_news_all.posted_month]
    pivots: [hacker_news_all.type]
    fill_fields: [hacker_news_all.posted_month]
    filters: {}
    sorts: [hacker_news_all.type, hacker_news_all.posted_month desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Type: hacker_news_all.type
      Posted Month: hacker_news_all.posted_month
      Title: hacker_news_all.title
    row: 3
    col: 8
    width: 8
    height: 8
  - title: Untitled
    name: Untitled
    model: hn_bigquery
    explore: hacker_news_all
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [hacker_news_all.count_stories, hacker_news_all.count_comments, hacker_news_all.count_jobs,
      hacker_news_all.count_polls]
    filters: {}
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '14'
    style_hacker_news_all.count_stories: "#3B4245"
    show_title_hacker_news_all.count_stories: true
    title_overrride_hacker_news_all.count_stories: Stories
    title_placement_hacker_news_all.count_stories: above
    value_format_hacker_news_all.count_stories: ''
    style_hacker_news_all.count_comments: "#3B4245"
    show_title_hacker_news_all.count_comments: true
    title_overrride_hacker_news_all.count_comments: Comments
    title_placement_hacker_news_all.count_comments: above
    value_format_hacker_news_all.count_comments: ''
    show_comparison_hacker_news_all.count_comments: false
    style_hacker_news_all.count_jobs: "#3B4245"
    show_title_hacker_news_all.count_jobs: true
    title_overrride_hacker_news_all.count_jobs: Jobs
    title_placement_hacker_news_all.count_jobs: above
    value_format_hacker_news_all.count_jobs: ''
    show_comparison_hacker_news_all.count_jobs: false
    style_hacker_news_all.count_polls: "#3B4245"
    show_title_hacker_news_all.count_polls: true
    title_overrride_hacker_news_all.count_polls: Polls
    title_placement_hacker_news_all.count_polls: above
    value_format_hacker_news_all.count_polls: ''
    show_comparison_hacker_news_all.count_polls: false
    style_hacker_news_all.average_ranking: "#3B4245"
    show_title_hacker_news_all.average_ranking: true
    title_overrride_hacker_news_all.average_ranking: Avg. Ranking
    title_placement_hacker_news_all.average_ranking: above
    value_format_hacker_news_all.average_ranking: ''
    show_comparison_hacker_news_all.average_ranking: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    title_hidden: true
    listen:
      Type: hacker_news_all.type
      Posted Month: hacker_news_all.posted_month
      Title: hacker_news_all.title
    row: 0
    col: 0
    width: 24
    height: 3
  - title: History
    name: History
    model: hn_bigquery
    explore: hacker_news_all
    type: looker_line
    fields: [hacker_news_all.posted_month, hacker_news_all.count_comments, hacker_news_all.count_stories,
      hacker_news_all.count_polls, hacker_news_all.count_jobs]
    fill_fields: [hacker_news_all.posted_month]
    filters: {}
    sorts: [hacker_news_all.posted_month desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Type: hacker_news_all.type
      Posted Month: hacker_news_all.posted_month
      Title: hacker_news_all.title
    row: 11
    col: 0
    width: 24
    height: 6
  filters:
  - name: Type
    title: Type
    type: field_filter
    default_value: comment,story
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: hn_bigquery
    explore: hacker_news_all
    listens_to_filters: []
    field: hacker_news_all.type
  - name: Posted Month
    title: Posted Month
    type: field_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: hn_bigquery
    explore: hacker_news_all
    listens_to_filters: []
    field: hacker_news_all.posted_month
  - name: Title
    title: Title
    type: field_filter
    default_value: "-EMPTY"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: hn_bigquery
    explore: hacker_news_all
    listens_to_filters: []
    field: hacker_news_all.title
