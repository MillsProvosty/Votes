require 'bundler'
Bundler.require
require_all'app'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise "Migrations are pending, run `rake db:migrate` to resolve the issue"
end

run ApplicationController
# use MerchantsBusinessLogicController
