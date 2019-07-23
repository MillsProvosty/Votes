require 'bundler'
Bundler.require
require_all 'app'

require File.expand_path('../config/environment',__FILE__)

run VotesApp
