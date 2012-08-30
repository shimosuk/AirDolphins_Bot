class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def self.consumer
    OAuth::Consumer.new(
      ENV[CONSUMER_KEY],
      ENV[CONSUMER_SECRET],
      {site: "http://api.twitter.com"}
    )
  end
end
