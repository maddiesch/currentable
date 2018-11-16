require 'currentable/cleaner'

module Currentable
  module Middleware
    module Sidekiq
      module Server
        class Cleaner
          def call(_worker, _job, _queue)
            Currentable::Cleaner.clean_all
            begin
              yield
            ensure
              Currentable::Cleaner.clean_all
            end
          end
        end
      end
    end
  end
end
