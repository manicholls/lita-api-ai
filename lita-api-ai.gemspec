Gem::Specification.new do |spec|
  spec.name          = 'lita-api-ai'
  spec.version       = '0.1.3'
  spec.authors       = ['Mark Nicholls']
  spec.email         = ['mark@nichollsclan.ca']
  spec.description   = 'Api-AI based bot ai'
  spec.summary       = 'yet another AI option for your bot.'
  spec.homepage      = 'https://github.com/manicholls/lita-api-ai'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '~> 4.7'
  spec.add_runtime_dependency 'api-ai-ruby', '>= 2.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'pry-byebug', '>= 3.4'
  spec.add_development_dependency 'rake', '>= 12.0'
  spec.add_development_dependency 'rack-test', '~> 0.6'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
