require "./app"
require "sinatra/activerecord/rake"


task :console do
  Pry.start
end

namespace :db do
  desc "Run the migrations"
  task(:migration) do
    require_all "./db/migrate"
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Base.connection.migration_context.migrate
  end
end
