class IndexController < ApplicationController
  def index

    rubytter = OAuthRubytter.new(self.class.token)
    @tweets = rubytter.friends_timeline

  end

end
