module Currentable
  class Registry
    MUTEX = Mutex.new

    class << self
      def register_current(klass)
        MUTEX.synchronize do
          _currents.add(klass)
        end
      end

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
