require_relative 'cleaner'

RSpec.configure do |config|
  config.after(:each) { Currentable::Cleaner.clean_all }
end
