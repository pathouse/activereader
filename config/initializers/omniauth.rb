consumer_key = ENV["EVERNOTE_CONSUMER_KEY"]
consumer_secret = ENV["EVERNOTE_SECRET_KEY"]
sandbox = ENV["EVERNOTE_SANDBOX"]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :evernote, consumer_key, consumer_secret, client_options: { site: sandbox }
end

OmniAuth.config.on_failure = User::AccountController.action(:show)
