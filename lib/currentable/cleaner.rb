module Currentable
  class Cleaner
    class << self
      def clean_all
        Currentable::Registry.currents.each do |klass|
          if defined? ::Rails
            Rails.logger.debug "Cleaning current for #{klass}"
          end
          klass.current = nil
        end
      end
    end
  end
end
