class GithubService

  def initialize
    @connection = Hurley::Client.new("https://api.github.com")
  end

  def following

  end
end