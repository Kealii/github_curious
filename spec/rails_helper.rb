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

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
        provider: 'github',
        extra: {
          raw_info: {
            uid: '1',
            name: 'Test User'
          }
        },
        credentials: {
          token:  ENV['GITHUB_TOKEN'],
          secret: ENV['GITHUB_SECRET']
        }
      })
end

def login_with_oauth
  visit login_path
end

def bad_omniauth_credentials
  OmniAuth.config.test_mode=true
end