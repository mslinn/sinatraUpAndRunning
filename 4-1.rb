require 'sinatra/base'

# For this to be run as a rack app, config.ru must contain:
#   require './4-1'
#   run MyApp
#
# Invoke on port 9292:
#   rackup
# Or on port 4567:
#   rackup -p 4567
class MyApp < Sinatra::Base
  get '/' do
    "Hello from MyApp!"
  end

  # The following is only present to allow rerun to run the webapp,
  # instead of always having to use rackup.
  #
  # Rerun sets $0 to the name of the file being run.
  #
  # If the current file (__FILE__) is the one executing ($0) then call run!.
  #
  # Possible messages include:
  #   "Invoked by /home/mslinn/.rbenv/versions/3.1.0/bin/rackup"
  #   "Invoked by 4-1.rb"
  p "Invoked by #{$0}"
  run! if __FILE__ == $0
end
