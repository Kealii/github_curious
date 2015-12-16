require "rails_helper"

feature 'testing oauth' do

  before do
    OmniAuth.config.mock_auth[:github] = nil
  end

  scenario 'login with github' do
    stub_omniauth
    login_with_oauth

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logged in!')
    expect(page).to have_content('Test User')
    # expect(page).to have_content('Followers: 5')
    expect(page).to have_content('Following: 3')
    expect(page).to have_content('Logout')
  end

  scenario 'logout of github' do
    stub_omniauth
    login_with_oauth
    visit logout_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logged out!')
    expect(page).to have_content('Login')
  end
end