Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,      ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  provider :google_oauth2, ENV['GOOGLE_KGOOGLE_APP_IDEY'],   ENV['GOOGLE_APP_SECRET']
end
