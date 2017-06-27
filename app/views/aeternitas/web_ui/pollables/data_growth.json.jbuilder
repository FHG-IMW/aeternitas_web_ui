json.labels(@pollables_created.map { |v| v[:timestamp].strftime('%B %d. %H:%M') })
json.datasets do
  json.array! [
    {
      label: "Created #{@pollable.name.pluralize}",
      data: @pollables_created.map { |v| v[:count] },
      borderColor: '#96C0CE',
      backgroundColor: 'rgba(171,221,235,0.5)',
      fill: false,
      type: 'line'
    },
    {
      label: "Created Sources",
      data: @sources_created.map { |v| v[:count] },
      borderColor: "#32b643",
      backgroundColor: "rgba(50,182,67,0.5)",
      fill: false,
      type: 'line'
    }
  ]
end