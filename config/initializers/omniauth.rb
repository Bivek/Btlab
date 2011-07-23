Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_CONSUMER_KEY, TWITTER_SECRET_KEY
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, {:scope => FACEBOOK_APP_PERMISSIONS }

end
