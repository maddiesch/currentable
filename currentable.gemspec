lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'currentable/version'

Gem::Specification.new do |spec|
  spec.name          = 'currentable'
  spec.version       = Currentable::VERSION
  spec.authors       = ['Maddie Schipper']
  spec.email         = ['me@maddiesch.com']

  spec.summary       = 'Track Current Objects'
  spec.description   = 'Track Current Objects'
  spec.homepage      = 'https://github.com/maddiesch/currentable'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/maddiesch/currentable'

  spec.files         = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry',     '~> 0.12'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
end
