json.labels(@polls.map { |v| v[:timestamp].strftime("%H:%M") })
json.datasets do
  json.array! [
    {
      label: '# Polls',
      data: @polls.map { |v| v[:count] },
      borderColor: "#96C0CE",
      backgroundColor: "rgba(171,221,235,0.5)"
    },
    {
      label: '# Failures',
      data: @failures.map { |v| v[:count] },
      borderColor: "#C25B56",
      backgroundColor: "rgba(255,116,111,0.5)"
    }
  ]
end
