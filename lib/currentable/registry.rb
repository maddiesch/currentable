module Currentable
  ##
  # @private
  #
  # Contains all the classes that are registered as Currentable instances.
  class Registry
    ##
    # @private
    #
    # Registry lock.
    MUTEX = Mutex.new

    class << self
      ##
      # @private
      #
      # Adds a class as a current
      #
      # @param klass [Currentable::Instance] The class instance to register.
      def register_current(klass)
        MUTEX.synchronize do
          _currents.add(klass)
        end
      end

      ##
      # @private
      #
      # Return all currents registered.
      #
      # @return [Array<Currentable::Instance>]
      def currents
        MUTEX.synchronize { _currents }
      end

      private

      def _currents
        @currents ||= Set.new
        @currents
      end
    end
  end
end
