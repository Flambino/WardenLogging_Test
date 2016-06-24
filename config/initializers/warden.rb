# Be sure to restart your server when you modify this file.

# Load strategies
Dir["./app/strategies/*.rb"].each { |file| require file }
#
# # Warden config
# Warden::Manager.serialize_into_session do |user|
#   "foo"
# end
#
# Warden::Manager.serialize_from_session do |id|
#   "foo"
# end

# Add middleware
Rails.application.config.middleware.insert_after ActionDispatch::Session::CookieStore, Warden::Manager do |manager|
  manager.failure_app = UnauthorizedController
  manager.default_strategies :locked
end
