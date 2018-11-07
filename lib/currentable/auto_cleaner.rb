require_relative 'cleaner'

module Currentable
  class AutoCleaner
    def initialize(app)
      @app = app
    end

    def call(*args)
      @app.call(*args)
    ensure
      Currentable::Cleaner.clean_all
    end
  end
end
