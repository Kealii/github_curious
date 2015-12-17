class GithubService

  attr_reader :connection, :logger

  def initialize(current_user = nil, logger = nil)
    @logger = logger
    @connection = Hurley::Client.new("https://api.github.com")

    if Rails.env.test?
      @connection.query[:access_token] = ENV['GITHUB_PERSONAL']
    else
      @connection.query[:access_token] = current_user.access_token
    end
  end

  def following_count
    logger.debug 'getting following count'
    parse(connection.get('/user/following')).count
  end

  def followers_count
    parse(connection.get('/user/followers')).count
  end

  def starred_count
    parse(connection.get('/user/starred')).count
  end

  def repos
    logger.debug 'fetching repos'
    parse(connection.get('/user/repos'))
  end

  def orgs
    parse(connection.get('/user/orgs'))
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end