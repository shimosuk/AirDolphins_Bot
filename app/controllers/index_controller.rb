# encoding: utf-8
class IndexController < ApplicationController
  def index

    rubytter = OAuthRubytter.new(self.class.token)
    @tweets = rubytter.friends_timeline
    @members = Profile.order("number")

  end

  def update

    tweet = params[:tweet]

    rubytter = OAuthRubytter.new(self.class.token)
    rubytter.update("#{tweet} (tweet by #{current_user.screen_name})")

    redirect_to :index
  end
end
