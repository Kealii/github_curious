require 'rails_helper'

feature 'github service test' do
  let(:service) { GithubService.new }

  scenario '#following_count' do
    VCR.use_cassette('github service #following_count') do
      following_count = service.following_count

      assert_equal 0, following_count
    end
  end

  scenario '#followers_count' do
    VCR.use_cassette('github service #followers_count') do
      followers_count = service.followers_count

      assert_equal 0, followers_count
    end
  end
end