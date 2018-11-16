require_relative 'middleware/rails/cleaner'

module Currentable
  ##
  # Auto installs the middleware for clearing currents in a Rails application.
  class Railtie < ::Rails::Railtie
    initializer 'currentable.install_middleware' do |app|
      app.middleware.insert_after ActionDispatch::RemoteIp, Currentable::Middleware::Rails::Cleaner
    end
  end
end
