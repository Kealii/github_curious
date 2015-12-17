class GithubService

  attr_reader :connection

  def initialize(current_user = nil)
    @connection = Hurley::Client.new("https://api.github.com")
    if Rails.env.test?
      @connection.query[:access_token] = ENV['GITHUB_PERSONAL']
    else
      @connection.query[:access_token] = current_user.access_token
    end
  end

  def following_count
    parse(connection.get('/user/following')).count
  end

  def followers_count
    parse(connection.get('/user/followers')).count
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end