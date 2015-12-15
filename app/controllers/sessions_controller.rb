class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid(auth["uid"]) || User.from_omniauth(auth)
    session[:user_id] = user.id
    flash[:notice] = "Signed in!"
    redirect_to root_url
  end

  def destroy
    flash[:notice] = "Signed out!"
    session[:user_id] = nil
    redirect_to root_url
  end
end
