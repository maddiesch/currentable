# Currentable

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/currentable`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'currentable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install currentable

## Usage

```ruby
class Person < ActiveRecord::Base
  include Currentable::Instance
end

Person.current = Person.find(1)

Person.current
# => Person(id: 1)

Currentable::Cleaner.clean_all

Person.current
# => nil
```

The cleaner handles registering all classes that need to be cleaned up.

### Rails

Middleware will automatically be added to cleanup before and after each request.

### Sidekiq

Middleware will be automatically be added to cleanup before and after each worker.
