require 'sinatra'

# This chunk of code is only executed when the program is loaded.
# Define an array of viable moves that a player (and the computer) can perform
set :defeat, {rock: :scissors, paper: :rock, scissors: :paper}
set :throws, settings.defeat.keys
p "settings.defeat=#{settings.defeat}"
p "settings.throws=#{settings.throws}"

set :menu, <<~EOF
  <p>
    Throw <a href='/throw/rock'>rock</a>,
    <a href='/throw/paper'>paper</a> or
    <a href='/throw/scissors'>scissors</a>
  </p>
EOF

# Block executed before each request is processed
before do
  # content_type :txt
end

after do
end

get '/' do
  # content_type :html # content_type text/html is default
  settings.menu
end

get '/throw/:type' do
  # The params[Symbol, String] hash stores querystring and form data.
  player_throw = params[:type].to_sym

  # If a user provides an invalid throw, halt the processing of the
  # current request by returning status code 403 (Forbidden),
  # and remind them of valid throws.
  unless settings.throws.include?(player_throw)
    halt 403, "You must throw one of the following: #{settings.throws.join(", ")}.<br>\n" +
      settings.menu
  end
  settings.menu
end
