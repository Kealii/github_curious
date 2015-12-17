require 'rails_helper'

feature 'displaying repositories' do

  before do
    OmniAuth.config.mock_auth[:github] = nil
  end

  scenario 'has repositories' do
    VCR.use_cassette('has repositories') do
      stub_omniauth
      login_with_oauth

      expect(current_path).to eq(root_path)
      expect(page).to have_content('traffic-spy')
    end
  end
end