require 'rails_helper'

feature 'displaying repositories' do

  before :each do
    OmniAuth.config.mock_auth[:github] = nil
    stub_omniauth
  end

  scenario 'has repositories' do
    VCR.use_cassette('has repositories') do
      login_with_oauth

      expect(current_path).to eq(root_path)
      expect(page).to have_content('traffic_spy')
    end
  end
end