require 'sinatra/base'

Dir.glob('./{helpers,controllers}/*.rb').each do |file|
  # puts "Requiring #{file}"
  require file
end

map('/')        { run ApplicationController }
map('/example') { run ExampleController }
