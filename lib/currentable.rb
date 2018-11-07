require 'currentable/cleaner'
require 'currentable/instance'
require 'currentable/registry'
require 'currentable/version'

if defined? ::Rails
  require 'currentable/railtie'
end

module Currentable
end
