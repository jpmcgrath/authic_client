Rails.application.config.middleware.use OmniAuth::Builder do

  #TODO: Change to PROD url
  provider :authic, AuthicClient::AUTHIC_CLIENT_KEY, AuthicClient::AUTHIC_CLIENT_SECRET, :subdomain => AuthicClient::AUTHIC_CLIENT_SUBDOMAIN, :domain => "authicstaging.com"
  
end