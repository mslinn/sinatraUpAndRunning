require 'sinatra'
require 'erb'
require './sinatra/link_helper'

get '*' do
  erb :links # default location is views/links.erb
end
