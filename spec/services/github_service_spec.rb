require 'rails_helper'

feature 'github service test' do
  let(:service) { GithubService.new }

  scenario '#following' do
    VCR.use_cassette('github service #following') do
      following = service.following

      assert_equal 0, following.count
    end
  end
end