require 'rails_helper'

feature 'displaying organizations' do

  before :each do
    OmniAuth.config.mock_auth[:github] = nil
    stub_omniauth
  end

  scenario 'has organizations' do
    VCR.use_cassette('has organizations') do
      login_with_oauth

      expect(current_path).to eq(root_path)
      expect(page).to have_content('pivotal')
      expect(page).to have_content('JumpstartLab')
    end
  end
end