require 'rails_helper'

feature 'displaying basic info' do

  before do
    OmniAuth.config.mock_auth[:github] = nil
  end

  scenario 'has basic info' do
    VCR.use_cassette('has basic info') do
      stub_omniauth
      login_with_oauth

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Test User')
      expect(page).to have_content('Followers: 13')
      expect(page).to have_content('Following: 3')
      expect(page).to have_content('Starred: 5')
    end
  end
end