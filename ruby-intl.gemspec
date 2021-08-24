# frozen_string_literal: true
require_relative 'lib/ruby/intl/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-intl'
  spec.version       = Ruby::Intl::VERSION
  spec.authors       = ['Manuel']
  spec.email         = ['manu@meetsam.io']

  spec.summary       = 'Intl api like for ruby'
  spec.description   = '[Intl](https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Intl) api like for ruby'
  spec.homepage      = 'https://github.com/3mundi/ruby-intl'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/3mundi/ruby-intl'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'execjs'
  # spec.add_runtime_dependency 'twitter_cldr'
  spec.add_runtime_dependency 'ruby-cldr'
end
