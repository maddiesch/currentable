require_relative 'middleware/sidekiq/server/cleaner'

::Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Currentable::Middleware::Sidekiq::Server::Cleaner
  end
end
