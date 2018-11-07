require_relative 'auto_cleaner'

module Currentable
  class Railtie < Rails::Railtie
    initializer 'currentable.install_middleware' do |app|
      app.middleware.insert_after ActionDispatch::RemoteIp, Currentable::AutoCleaner
    end
  end
end
