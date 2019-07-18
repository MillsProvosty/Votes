require 'rack/test'
require 'rspec'
require './config/environment'
SimpleCov.start

ENV['RACK_ENV'] = 'test'


def app
  Sinatra::Application
end

FactoryBot.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryBot.find_definitions

RSpec.configure do |config|
 config.include Rack::Test::Methods
end

module RSpecMixin
  include Rack::Test::Methods
  def app() VotesApp end 
end

# Capybara.app = VotesApp
# Capybara.save_path = 'tmp/capybara'

RSpec.configure do |c|
  # c.include Capybara::DSL
  c.include RSpecMixin
end
