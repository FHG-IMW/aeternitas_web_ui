range = TabsTabs::Helpers.timestamp_range(@from..@to, @resolution)

json.labels(range.map {|ts| ts.strftime("%B %d. %H:%M")})
json.datasets do
  json.array! [
    {
      label: '# Polls',
      data: Aeternitas::Metrics.polls(@pollable, from: @from, to: @to, resolution: @resolution).map {|v| v[:count]},
      borderColor: "#96C0CE",
      backgroundColor: "rgba(171,221,235,0.5)",
      fill: false,
      type: 'line'
    },
    {
      label: '# Successfull Polls',
      data: Aeternitas::Metrics.successful_polls(@pollable, from: @from, to: @to, resolution: @resolution).map {|v| v[:count]},
      borderColor: "#32b643",
      backgroundColor: "rgba(50,182,67,0.5)",
    },
    {
      label: '# Failures',
      data: Aeternitas::Metrics.failed_polls(@pollable, from: @from, to: @to, resolution: @resolution).map {|v| v[:count]},
      borderColor: "#C25B56",
      backgroundColor: "rgba(255,116,111,0.5)",
    },
    {
      label: '# Guard Locked',
      data: Aeternitas::Metrics.guard_locked(@pollable, from: @from, to: @to, resolution: @resolution).map {|v| v[:count]},
      borderColor: "#ffd59c",
      backgroundColor: "rgba(255,213,156,0.5)",
    }
  ]
end
