ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'simplecov'
require 'capybara/rails'
SimpleCov.start 'rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:github, { uid: '12345', name: 'michael' })

def login_with_oauth
  visit '/auth/github'
end