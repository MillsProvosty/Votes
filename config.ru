require 'bundler'
Bundler.require
require_all 'app'

require './main'
run Sinatra::Application

require File.expand_path('../config/environment',__FILE__)

run VotesApp
