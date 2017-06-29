ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment.rb", __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'
require 'timecop'
require 'rails-controller-testing'
require 'database_cleaner'


Rails.backtrace_cleaner.remove_silencers!
Rails::Controller::Testing.install

DatabaseCleaner[:redis].strategy = :truncation
DatabaseCleaner[:active_record].strategy = :truncation

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    Rails.application.load_seed
  end

  config.before(:suite) do |suite|
    DatabaseCleaner.start
  end

  config.after(:suite) do
    DatabaseCleaner.clean!
  end
end

