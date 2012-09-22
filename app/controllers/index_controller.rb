class IndexController < ApplicationController
  def index

    rubytter = OAuthRubytter.new(self.class.token)
    @tweets = rubytter.friends_timeline

  end

  def update

    tweet = params[:tweet]
    day = Time.now

    rubytter = OAuthRubytter.new(self.class.token)
    rubytter.update("#{tweet} \(#{day}\)")

    redirect_to :index
  end

  def reply
    user = params[:user]
    id = params[:id]
    tweet = params[:tweet]
    rubytter = OAuthRubytter.new(self.class.token)
    rubytter.update("@#{user} #{tweet}", :in_reply_to_status_id => id)
    redirect_to :index
  end
end
