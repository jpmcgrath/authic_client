module AuthicClient
  # Authic config
  AUTHIC_CLIENT_KEY ||= ENV['AUTHIC_CLIENT_KEY'] ||= '< your authic client key >'  
  AUTHIC_CLIENT_SECRET ||= ENV['AUTHIC_CLIENT_SECRET'] ||= '< your authic client secret >'  
  AUTHIC_CLIENT_SUBDOMAIN ||= ENV['AUTHIC_CLIENT_SUBDOMAIN'] ||= '< your authic subdomain >'
end