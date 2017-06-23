# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sofreight_api/version'

Gem::Specification.new do |spec|
  spec.name          = "sofreight_api"
  spec.version       = SofreightApi::VERSION
  spec.authors       = ["Johann Wilfrid-Calixte"]
  spec.email         = ["johann@buyco.org"]

  spec.summary       = %q{Communication with So Freight API}
  spec.description   = %q{Communication with So Freight API}
  spec.homepage      = "https://git.dapp.bc-fg.com/buyco/sofreight_api"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activemodel'
  spec.add_dependency 'enumerize'
  spec.add_dependency 'faraday'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
