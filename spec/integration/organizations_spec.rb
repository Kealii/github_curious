require 'rails_helper'

feature 'displaying organizations' do

  before do
    OmniAuth.config.mock_auth[:github] = nil
  end

  scenario 'has organizations' do
    VCR.use_cassette('has organizations') do
      stub_omniauth
      login_with_oauth

      expect(current_path).to eq(root_path)
      expect(page).to have_content('pivotal')
      expect(page).to have_content('JumpstartLab')
    end
  end
end