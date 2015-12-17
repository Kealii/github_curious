class SessionsController < ApplicationController
  def create
    logger.debug 'creating session'
    auth = request.env["omniauth.auth"]
    logger.debug "auth is #{auth}"
    user = User.find_by_uid(auth["uid"]) || User.from_omniauth(auth)
    session[:user_id] = user.id
    flash[:notice] = "Logged in!"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_url
  end
end
