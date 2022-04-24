- dashboard: firebolt_performance_comparison
  title: Firebolt Performance Comparison
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Average Dashboard Runtime
    name: Average Dashboard Runtime
    model: system__activity
    explore: dashboard_performance
    type: looker_column
    fields: [dashboard_history_stats.avg_runtime, dashboard_history_stats.avg_tile_runtime,
      dashboard.title]
    pivots: [dashboard.title]
    filters: {}
    sorts: [dashboard_history_stats.avg_runtime desc 0, dashboard.title]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    label_value_format: 0.00 "Seconds"
    series_colors:
      HN Firebolt Demo - 164 - dashboard_history_stats.avg_runtime: "#D13452"
      HN BigQuery Demo - 165 - dashboard_history_stats.avg_runtime: "#4075F0"
    series_labels:
      HN BigQuery Demo - 165 - dashboard_history_stats.avg_runtime: BigQuery Dashboard
      HN Firebolt Demo - 164 - dashboard_history_stats.avg_runtime: Firebolt Dashboard
    defaults_version: 1
    hidden_fields: [dashboard_history_stats.avg_tile_runtime]
    listen:
      Title: dashboard.title
    row: 2
    col: 0
    width: 12
    height: 8
  - title: Average Tile Runtime
    name: Average Tile Runtime
    model: system__activity
    explore: dashboard_performance
    type: looker_column
    fields: [dashboard_history_stats.avg_runtime, dashboard_history_stats.avg_tile_runtime,
      dashboard.title]
    pivots: [dashboard.title]
    filters:
      dashboard.title: HN BigQuery Demo,HN Firebolt Demo
    sorts: [dashboard_history_stats.avg_runtime desc 0, dashboard.title]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    label_value_format: 0.00 "Seconds"
    series_colors:
      HN BigQuery Demo - 165 - dashboard_history_stats.avg_tile_runtime: "#4075F0"
      HN Firebolt Demo - 164 - dashboard_history_stats.avg_tile_runtime: "#D13452"
    series_labels:
      HN BigQuery Demo - 165 - dashboard_history_stats.avg_tile_runtime: BigQuery
        Dashboard
      HN Firebolt Demo - 164 - dashboard_history_stats.avg_tile_runtime: Firebolt
        Dashboard
    defaults_version: 1
    hidden_fields: [dashboard_history_stats.avg_runtime]
    listen: {}
    row: 2
    col: 12
    width: 12
    height: 8
  - title: Dashboard Response Time
    name: Dashboard Response Time
    model: system__activity
    explore: dashboard_performance
    type: looker_area
    fields: [history.completed_time, dashboard.title, history.average_runtime]
    pivots: [dashboard.title]
    filters:
      dashboard.title: HN BigQuery Demo,HN Firebolt Demo
    sorts: [history.completed_time desc, dashboard.title]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    x_axis_label: Wall Clock
    series_types: {}
    series_colors:
      HN Firebolt Demo - 164 - history.average_runtime: "#D13452"
      HN BigQuery Demo - 165 - history.average_runtime: "#4075F0"
    series_labels:
      HN BigQuery Demo - 165 - history.average_runtime: BigQuery Dashboard
      HN Firebolt Demo - 164 - history.average_runtime: Firebolt Dashboard
    defaults_version: 1
    ordering: none
    show_null_labels: false
    listen: {}
    row: 10
    col: 0
    width: 24
    height: 7
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<p style="text-align: center;">Timings are of identical dashboards
      querying identical Hacker News full data extracts (31m rows), one hosted in
      Firebolt and the other in Google BigQuery.</p>'
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Title
    title: Title
    type: field_filter
    default_value: HN BigQuery Demo,HN Firebolt Demo
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: dashboard_performance
    listens_to_filters: []
    field: dashboard.title
