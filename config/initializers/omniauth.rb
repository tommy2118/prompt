Rails.application.config.middleware.use OmniAuth::Builder do
  provider :medium, ENV['MEDIUM_KEY'], ENV['MEDIUM_SECRET']
end
