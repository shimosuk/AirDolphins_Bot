class IndexController < ApplicationController
  def index

    rubytter = OAuthRubytter.new(self.class.token)
    @tweets = rubytter.friends_timeline

  end

  def update

    tweet = params[:tweet]
    speaker = User.find(session[:user_id]).screen_name

    rubytter = OAuthRubytter.new(self.class.token)
    rubytter.update("#{tweet} (tweet by #{speaker})")

    redirect_to :index
  end

  def reply
    user = params[:user]
    id = params[:id]
    tweet = params[:tweet]
    speaker = User.find(session[:user_id]).screen_name

    rubytter = OAuthRubytter.new(self.class.token)
    rubytter.update("@#{user} #{tweet} \(tweet by #{speaker}\)", :in_reply_to_status_id => id)
    redirect_to :index
  end
end
