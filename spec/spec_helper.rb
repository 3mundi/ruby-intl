require 'bundler/setup'
require 'ruby/intl'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

CHECK_PARTS = false

require 'yaml'
Javascript::Intl.cache = true
Javascript::Intl.storage.update(YAML.load(File.read('storage.yml'))) if File.exist?('storage.yml')

RSpec.configure do |config|
  config.after(:all) { File.write('storage.yml', Javascript::Intl.storage.to_yaml) }
end
