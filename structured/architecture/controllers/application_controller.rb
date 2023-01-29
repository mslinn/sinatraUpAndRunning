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
    @message = <<~EOF
      <p>Please add a route for / to your <code>ApplicationController</code> subclsss.</p>
    EOF
    erb :index
  end

  not_found do
    erb File.directory?(".#{request.path}") ? :index : :not_found
  end
end
