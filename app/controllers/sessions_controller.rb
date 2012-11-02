class SessionsController < ApplicationController
  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_user(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    profile = user.profile || Profile.create(user.name, user.uid)

    session[:user_id] = user.id
    redirect_to :edit_profile
  end

  def destroy
    session[:user_id] = nil
    redirect_to :index
  end
end
