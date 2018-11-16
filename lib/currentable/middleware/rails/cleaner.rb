require 'currentable/cleaner'

module Currentable
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
      def call(*args)
        @app.call(*args)
      ensure
        Currentable::Cleaner.clean_all
      end
    end
  end
end
