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

  def following
    parse(connection.get('/user/following'))
  end

  def followers_count
    parse(connection.get('/user/followers')).count
  end

  def starred_count
    parse(connection.get('/user/starred')).count
  end

  def repos
    parse(connection.get('/user/repos'))
  end

  def orgs
    parse(connection.get('/user/orgs'))
  end

  def events(login)
    parse(connection.get("/users/#{login}/events"))
  end

  def commits(login)
    if Rails.env.test?
      nil
    else
      events(login).select{ |event| event[:type] == "PushEvent"}
    end
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end