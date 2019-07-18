require './config/environment'
SimpleCov.start

def app
  Sinatra::Application
end

FactoryBot.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryBot.find_definitions

RSpec.configure do |config|
 config.include Rack::Test::Methods
end
