class IndexController < ApplicationController
  def index
  end

  def oauth
    callback_url = "http://#{request.host_with_port}/callback"
    request_token = self.class.consumer.get_request_token(oauth_callback: callback_url)

    session[:request_token] = {
      token: request_token.token,
      select: request_token.secret,
    }

    redirect_to request_token.authorize_url
  end

  def callback
  end
end
