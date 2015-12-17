require 'rails_helper'

feature 'github service test' do
  let(:dummy_logger) {double(:logger, debug: 'true')}
  let(:service) { GithubService.new(nil, dummy_logger) }

  scenario '#following_count' do
    VCR.use_cassette('github service #following_count') do
      following_count = service.following_count

      assert_equal 3, following_count
    end
  end

  scenario '#followers_count' do
    VCR.use_cassette('github service #followers_count') do
      followers_count = service.followers_count

      assert_equal 13, followers_count
    end
  end

  scenario '#starred_count' do
    VCR.use_cassette('github service #starred_count') do
      starred_count = service.starred_count

      assert_equal 5, starred_count
    end
  end

  scenario '#repos' do
    VCR.use_cassette('github service #repos') do
      repos = service.repos

      assert_equal 30, repos.count
      assert_equal 'traffic_spy', repos.first[:name]
    end
  end

  scenario '#orgs' do
    VCR.use_cassette('github service #orgs') do
      orgs = service.orgs

      assert_equal 3, orgs.count
    end
  end
end