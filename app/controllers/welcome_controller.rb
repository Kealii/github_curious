class WelcomeController < ApplicationController
  def index
    if current_user
      @github_service = GithubService.new(current_user)
      @contributions  = Contribution.new(current_user.login)
    end
  end
end
