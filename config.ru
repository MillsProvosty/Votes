require 'bundler'
Bundler.require


if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise "Migrations are pending, run `rake db:migrate` to resolve the issue"
end

require File.expand_path('../config/environment', __FILE__)

run VotesApp
