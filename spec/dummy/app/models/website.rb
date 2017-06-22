class Website < ApplicationRecord
  include Aeternitas::Pollable

  polling_options do
    polling_frequency :daily
  end

  def poll
    raise "Test"
  end
end
