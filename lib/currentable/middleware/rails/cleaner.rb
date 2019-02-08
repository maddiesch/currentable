require 'rack/body_proxy'
require 'currentable/cleaner'

module Currentable
  module Middleware
    module Rails
      ##
      # @private
      #
      # Rails Middleware
      class Cleaner
        ##
        # @private
        def initialize(app)
          @app = app
        end

        ##
        # @private
        def call(env)
          response = @app.call(env)
          returned = response << Rack::BodyProxy.new(response.pop) do
            Currentable::Cleaner.clean_all
          end
        ensure
          Currentable::Cleaner.clean_all unless returned
        end
      end
    end
  end
end
