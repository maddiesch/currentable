require_relative 'registry'

module Currentable
  ##
  # Add the magic to a class.
  #
  # @example
  #   class Person < ActiveRecord::Base
  #     include Currentable::Instance
  #
  #     # ...
  #
  #   end
  #
  #   Person.current = Person.first
  #
  #   Person.current.first_name
  #   # => "Maddie"
  module Instance
    ##
    # @private
    def self.included(klass)
      super

      klass.extend(ClassMethods)

      Currentable::Registry.register_current(klass)
    end

    ##
    # Methods available on the class
    module ClassMethods
      ##
      # Set a current value on the current thread.
      #
      # @param current [Object, nil] The value for the current thread.
      def current=(current)
        if !current.nil? && !current.is_a?(self)
          raise ArgumentError, "#{current} (#{current.class.name}) is not an instance of #{name}"
        end
        Thread.current[current_identifier] = current
      end

      ##
      # Get the threads value for the current
      #
      # @return [Object, nil] The value stored for the current thread.
      def current
        Thread.current[current_identifier]
      end

      ##
      # @private
      #
      # The identifier for the current. Used as the thread hash key.
      def current_identifier
        "current.#{name}"
      end
    end
  end
end
