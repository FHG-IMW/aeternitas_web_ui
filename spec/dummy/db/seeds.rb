require 'timecop'

## Create 10 patents
10.times do |i|
  p = Patent.create!(patent_id: "EP123456#{i}")
  p.pollable_meta_data.last_polling = Time.now - rand(0.0..7.0).days
  p.pollable_meta_data.next_polling = p.next_polling + 2.weeks
  p.pollable_meta_data.save!
end

## Create 10 websites
10.times do |i|
  w = Website.create!(url: "https://example.com/#{i}")
  w.pollable_meta_data.last_polling = Time.now - rand(0.0..23.0).days
  w.pollable_meta_data.next_polling = w.next_polling + 1.day
  w.pollable_meta_data.save!

end

## Create a disabled website
deactivated = Website.create(url: 'https://example.com/23')
deactivated.pollable_meta_data.last_polling = 1.day.ago
deactivated.pollable_meta_data.save!
deactivated.disable_polling("Disabled!")


[3.days.ago, 2.days.ago, 1.day.ago, Time.now].each do |base|
  Timecop.travel(base)
  15.times { Aeternitas::Metrics.log(:polls, Website) }
  10.times { Aeternitas::Metrics.log(:successful_polls, Website) }
  3.times { Aeternitas::Metrics.log(:guard_locked, Website) }
  2.times { Aeternitas::Metrics.log(:failed_polls, Website) }
  13.times { Aeternitas::Metrics.log_value(:execution_time, Website, 2000) }
  Aeternitas::Metrics.log_value(:execution_time, Website, 5000)
  Aeternitas::Metrics.log_value(:execution_time, Website, 1000)
  10.times { Aeternitas::Metrics.log(:sources_created, Website) }
end

Timecop.travel(7.days.ago)
10.times { Aeternitas::Metrics.log(:polls, Patent) }
10.times { Aeternitas::Metrics.log(:successful_polls, Patent) }
13.times { Aeternitas::Metrics.log_value(:execution_time, Patent, 5000) }
Aeternitas::Metrics.log_value(:execution_time, Patent, 10000)
Aeternitas::Metrics.log_value(:execution_time, Patent, 5000)
4.times { Aeternitas::Metrics.log(:sources_created, Patent) }