require 'sinatra/base'

module Sinatra
  module PostGet
    def post_get(route, &block)
      get(route, &block)
      post(route, &block)
    end
  end
  # Register this module via Sinatra::Base
  register PostGet
end
