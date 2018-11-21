module Currentable
  ##
  # Cleans up all registered current objects.
  #
  # @note Will only clean for objects stored on the calling thread.
  #
  # @example
  #   Currentable::Cleaner.clean_all
  class Cleaner
    class << self
      ##
      # Sets all registered {Currentable::Instance} classes current value to nil
      #
      # @note Will only clean for objects stored on the calling thread.
      def clean_all
        Currentable::Registry.currents.each do |klass|
          if defined? ::Rails
            ::Rails.logger.debug "Cleaning current for #{klass}"
          end
          klass.current = nil
        end
        if defined? ::Rails
          ::Rails.logger.debug ''
        end
      end
    end
  end
end
