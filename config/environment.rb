
require 'sinatra'
require 'action_controller'




# require 'bundler'
# Bundler.require
# #The environment variable DATABASE_URL should be in the following format:
# # => postgres://{user}:{password}@{host}:{port}/path

#
# configure :production, :development do
# 	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/database_development')
#
# 	ActiveRecord::Base.establish_connection(
# 			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
# 			:host     => db.host,
# 			:username => db.user,
# 			:password => db.password,
# 			:database => db.path[1..-1],
# 			:encoding => 'utf8'
# 	)
# end

require 'bundler'
Bundler.require

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/app")
Dir.glob("#{File.dirname(__FILE__)}/app/*.rb")

ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :host     => "localhost",
  :database => "database_development"
)

require_all 'app'
