class SessionsController < ApplicationController
  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_user(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id

    profile = user.profile
    if profile.blank? then
      profile = Profile.create(user.id, user.name, user.uid)
      redirect_to :edit_profile
    end
    redirect_to :profile
  end

  def destroy
    session[:user_id] = nil
    redirect_to :index
  end
end
