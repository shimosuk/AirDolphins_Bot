class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def self.consumer
    OAuth::Consumer.new(
      ENV['CONSUMER_KEY'],
      ENV['CONSUMER_SECRET'],
      {site: "http://api.twitter.com"}
    )
  end

  protected
  def self.token
    OAuth::AccessToken.new(
      consumer,
      ENV['ACCESS_TOKEN'],
      ENV['ACCESS_TOKEN_SECRET']
    )
  end
end
