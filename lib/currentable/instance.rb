require_relative 'registry'

module Currentable
  module Instance
    def self.included(klass)
      super

      klass.extend(ClassMethods)

      Currentable::Registry.register_current(klass)
    end

    module ClassMethods
      def current=(current)
        Thread.current[current_identifier] = current
      end

      def current
        Thread.current[current_identifier]
      end

      def current_identifier
        "current.#{name}"
      end
    end
  end
end
