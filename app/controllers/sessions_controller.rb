class SessionsController < ApplicationController
  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_user(auth["provider"], auth["uid"])
    if user.blank? then
      user = User.create_with_omniauth(auth)
      profile = Profile.create(user.name, user.uid)
    end
      session[:user_id] = user.id
    redirect_to :profiles
  end

  def destroy
    session[:user_id] = nil
    redirect_to :index
  end
end
