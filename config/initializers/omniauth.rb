Rails.application.config.middleware.use OmniAuth::Builder do

  #TODO: Change to PROD url
  provider :authic, $authic_client_key, $authic_client_secret, :subdomain => $authic_client_subdomain, :domain => "authicstaging.com"
  
end