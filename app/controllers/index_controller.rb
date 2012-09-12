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
end
