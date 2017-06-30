json.data do
  json.array! @pollable_meta_data do |meta_data|
    json.identifier get_identifier(meta_data.pollable)
    json.status meta_data.state
    json.last_polling(meta_data.last_polling.present? ? l(meta_data.last_polling, format: :long) : nil)
    json.next_polling l(meta_data.next_polling, format: :long)
    json.sources meta_data.pollable.sources.count
  end
end

count = Aeternitas::PollableMetaData.where(pollable_class: @pollable.name).count
json.recordsTotal count
json.recordsFiltered count
