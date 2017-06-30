json.data do
  json.array! @pollable_meta_data do |meta_data|
    json.identifier get_identifier(meta_data.pollable)
    json.last_polling(meta_data.last_polling.present? ? l(meta_data.last_polling, format: :long) : nil)
    json.deactivation_reason meta_data.deactivation_reason
    json.deactivated_at l(meta_data.deactivated_at, format: :long)
  end
end

count = Aeternitas::PollableMetaData.deactivated.where(pollable_class: @pollable.name).count
json.recordsTotal count
json.recordsFiltered count
