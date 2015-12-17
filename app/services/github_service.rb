class GithubService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.github.com")
    if Rails.env.test?
      @connection.query[:access_token] = ENV['GITHUB_PERSONAL']
    end
  end

  def following
    JSON.parse(connection.get('/user/following').body, symbolize_names: true)
  end
end