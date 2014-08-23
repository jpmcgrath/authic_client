require "authic_client/engine"

module AuthicClient
  AUTHIC_CLIENT_KEY ||= ENV['AUTHIC_CLIENT_KEY']
  AUTHIC_CLIENT_SECRET ||= ENV['AUTHIC_CLIENT_SECRET']
  AUTHIC_CLIENT_SUBDOMAIN ||= ENV['AUTHIC_CLIENT_SUBDOMAIN']
  AUTHIC_CLIENT_FULL_URL ||= "https://#{AUTHIC_CLIENT_SUBDOMAIN}.authic.com"
end
