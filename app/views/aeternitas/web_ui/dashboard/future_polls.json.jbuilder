colors = Aeternitas::WebUi::ColorGenerator.new(@datasets.count)

json.labels @labels
json.datasets do
  json.array! @datasets do |pollable, data|
    json.label pollable
    json.data data
    json.backgroundColor colors.next.hex
    json.borderColor colors.current.hex
  end
end