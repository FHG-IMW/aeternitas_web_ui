json.labels(@polling_time.map {|v| v[:timestamp].strftime('%B %d. %H:%M')})
json.datasets do
  json.array! [
    {
      label: 'Average',
      data: @polling_time.map {|v| (v[:avg] * 1000).to_i},
      borderColor: '#96C0CE',
      backgroundColor: 'rgba(171,221,235,0.5)',
      fill: false,
      type: 'line'
    },
    {
      label: 'Minimum',
      data: @polling_time.map {|v| (v[:min] * 1000).to_i},
      borderColor: '#32b643',
      backgroundColor: 'rgba(50,182,67,0.5)',
      fill: false,
      type: 'line'
    },
    {
      label: 'Maximum',
      data: @polling_time.map {|v| (v[:max] * 1000).to_i},
      borderColor: '#ffd59c',
      backgroundColor: 'rgba(255,213,156,0.5)',
      fill: false,
      type: 'line'
    }
  ]
end