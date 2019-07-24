run bundle

rake db:create
rake db:migrate

RACK_ENV=test rake db:migrate

heroku rake db:migrate



### IMPORTANT! ###
If you come across either of the following errors:
- Puma caught this error: end of file reached (EOFError)
/Users/.../.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/shotgun-0.9.2/lib/shotgun/loader.rb:41:in 'load'

or

- ...may have been in progress in another thread when fork() was called. We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.

Run the following line after each change to the environment due to mac OS bug:

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
