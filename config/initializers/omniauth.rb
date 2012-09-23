Rails.application.config.middleware.use OmniAuth::Builder do
  provaider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end
