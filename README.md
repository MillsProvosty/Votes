### Description ###
Vote_app is a stand alone Sinatra application built to support the Oddio Rails App.
Its primary use is to act as a database for Oddio, storing, updating and retrieving votes and scores for landmarks, recordings and tours.

### Build Using ###
Sinatra 2.0.5
ActiveRecord
Postgresql
Fast JSON API

### Getting Started/Dependencies ###
run the following:

git clone
bundle install
bundle exec figaro install
bundle exec rake db:{create,migrate,seed}
RACK_ENV=test rake db:migrate
bundle

In order to get into Heroku's databse, run:
heroku psql

In order to add migrations to database, run:
rake db:create_migration NAME=create_thing

### API Endpoints ###
To create vote:
post '/api/v1/:votable_type/:votable_id/create_vote/:user_token/'
This request requires a valid `api_key` parameter.

To retrieve score:
get '/api/v1/:votable_type/:votable_id/score'

To update a vote:
get '/api/v1/:votable_type/:votable_id/update_vote/:id/:user_token/:rating'
This request requires a valid `api_key` parameter.


### IMPORTANT! ###
If you come across either of the following errors:
- "Puma caught this error: end of file reached (EOFError)
/Users/.../.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/shotgun-0.9.2/lib/shotgun/loader.rb:41:in 'load'"

or

- "...may have been in progress in another thread when fork() was called. We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug."

Run the following line after each change to the environment due to mac OS bug:

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
