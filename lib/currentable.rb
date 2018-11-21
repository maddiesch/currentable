require 'currentable/cleaner'
require 'currentable/instance'
require 'currentable/registry'
require 'currentable/version'

if defined? ::Rails
  require 'currentable/railtie'
end

if defined? ::Sidekiq
  require 'currentable/sidetie'
end

if defined? ::RSpec
  require 'currentable/rspectie'
end

##
# Adds a .current and .current= method to objects for thread storeage.
module Currentable
end
