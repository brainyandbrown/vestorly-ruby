require 'bundler/setup'
Bundler.setup

require 'vestorly_api'
require 'rspec'
require 'webmock'
require 'vcr'
require 'turn'

Turn.config do |config|
  config.format = :outline
  config.trace = true
  config.natural = true
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vestorly_api_cassettes'
  # config.hook_into :webmock
  config.configure_rspec_metadata!
end

VestorlyApi.configure do |config|
  config.api_uri = 'https://api.vestorly.com'
end

# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end