class Patent < ApplicationRecord
  include Aeternitas::Pollable

  polling_options do
    polling_frequency ->(patent) { patent.last_polling + 2.weeks }
  end

  def poll
    raise "Test"
  end
end
