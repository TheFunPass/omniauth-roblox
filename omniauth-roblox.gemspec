# frozen_string_literal: true

require_relative "lib/omniauth/roblox/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-roblox"
  spec.version       = Omniauth::Roblox::VERSION
  spec.authors       = ["Brian Ewell"]
  spec.email         = ["brian@brianewell.com"]

  spec.summary       = "Roblox OAuth2 Strategy for OmniAuth"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/super-dimension-studios/omniauth-roblox"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.8'
end
