module AuthicClient
  # Authic config
  AUTHIC_CLIENT_KEY ||= ENV['AUTHIC_CLIENT_KEY'] ||= '< your authic client key >'  
  AUTHIC_CLIENT_SECRET ||= ENV['AUTHIC_CLIENT_SECRET'] ||= '< your authic client secret >'  
  AUTHIC_CLIENT_SUBDOMAIN ||= ENV['AUTHIC_CLIENT_SUBDOMAIN'] ||= '< your authic subdomain >'
  # Dont touch the FULL URL variable, you might break everything!
  AUTHIC_CLIENT_FULL_URL = "https://#{AUTHIC_CLIENT_SUBDOMAIN}.authic.com"
  # end dont touch
end