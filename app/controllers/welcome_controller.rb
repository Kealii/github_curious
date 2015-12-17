class WelcomeController < ApplicationController
  def index
    if current_user
      @github_service = GithubService.new(current_user)
    end
  end
end
