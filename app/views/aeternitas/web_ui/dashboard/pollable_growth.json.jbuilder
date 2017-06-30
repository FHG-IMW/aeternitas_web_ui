colors = Aeternitas::WebUi::ColorGenerator.new(@pollable_classes.count)
range = TabsTabs::Helpers.timestamp_range(@from..@to, @resolution)

json.labels(range.map { |date| date.strftime('%B %d') })
json.datasets do
  json.array! @pollable_classes do |pollable_class|
    data = Aeternitas::Metrics.pollables_created(
      pollable_class,
      from: @from,
      to: @to,
      resolution: @resolution
    ).map { |v| v[:count] }

    json.label pollable_class.name
    json.data data
    json.borderColor colors.next.hex
    json.backgroundColor colors.current.hex
  end
end
