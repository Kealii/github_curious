class WelcomeController < ApplicationController
  def index
    if current_user
      logger.debug current_user
      @github_service = GithubService.new(current_user, logger)
    end
  end
end
