class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def self.consumer
    OAuth: :Consumer.new(
      'comsumerKey',
      'comsumerSecret',
      {site: "http://twitter.com"}
    )
  end
end
