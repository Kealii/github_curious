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

  scenario '#starred_count' do
    VCR.use_cassette('github service #starred_count') do
      starred_count = service.starred_count

      assert_equal 0, starred_count
    end
  end

  scenario '#repos' do
    VCR.use_cassette('github service #repos') do
      repos = service.repos

      assert_equal 30, repos.count
      assert_equal "active-record-sinatra", repos.first[:name]
    end
  end
end