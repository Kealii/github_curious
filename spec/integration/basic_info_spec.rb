require 'rails_helper'

feature 'displaying basic info' do

  before :each do
    OmniAuth.config.mock_auth[:github] = nil
    stub_omniauth
  end

  scenario 'has basic info' do
    VCR.use_cassette('has basic info') do
      login_with_oauth

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Test User')
      expect(page).to have_content('Followers')
      expect(page).to have_content('13')
      expect(page).to have_content('Following')
      expect(page).to have_content('3')
      expect(page).to have_content('Starred')
      expect(page).to have_content('5')
    end
  end
end