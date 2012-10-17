class IndexController < ApplicationController
  def index

    rubytter = OAuthRubytter.new(self.class.token)
    @tweets = rubytter.friends_timeline

  end

  def update

    tweet = params[:tweet]

    rubytter = OAuthRubytter.new(self.class.token)
    rubytter.update("#{tweet} (tweet by #{user.screen_name})")

    redirect_to :index
  end

  def reply
    user = params[:user]
    id = params[:id]
    tweet = params[:tweet]

    rubytter = OAuthRubytter.new(self.class.token)
    rubytter.update("@#{user} #{tweet} \(tweet by #{user.screen_name}\)", :in_reply_to_status_id => id)
    redirect_to :index
  end
end
