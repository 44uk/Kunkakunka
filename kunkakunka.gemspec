# -*- encoding: utf-8 -*-
require File.expand_path('../lib/kunkakunka/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["yukku0423"]
  gem.email         = ["yukku0423@gmail.com"]
  gem.description   = %q{クンカクンカ！クンカクンカ！スーハースーハー！スーハースーハー！いい匂いだなぁ…くんくん んはぁっ！}
  gem.summary       = %q{クンカクンカ！スーハースーハー！}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "kunkakunka"
  gem.require_paths = ["lib"]
  gem.version       = Kunkakunka::VERSION
end
