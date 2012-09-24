Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['JOIN_KEY'], ENV['JOIN_SECRET']
end
