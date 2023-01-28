# Base class
#  - Logging is enabled except for tests
#  - Views are accessed via /views
#  - ApplicationHelper included, so a `title` method is available in controllers and views
#  - Status 404 (Not Found) handler defined
class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  set :views, File.expand_path('../../views', __FILE__)

  configure :production, :development do
    enable :logging
  end

  get '/' do
    title 'Default Index Page'
    erb "<h1>Default Index</h1>\n<p>Please add a route for / to your <code>ApplicationController</code> subclsss.</p>"
  end

  not_found do
    title 'Not Found!'
    erb :not_found
  end
end
