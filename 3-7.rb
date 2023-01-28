require 'sinatra'
require './sinatra/post_get'

configure do
  set :menu_get, <<~EOF
    <p>
      <a href='/?name=Mary'>name=Mary</a>,
      <a href='/?name=George'>name=George</a>
    </p>
  EOF

  set :menu_post, <<~EOF
    <form method='post' action='/'>
      <input name='name' value='Chloe'>
      <input type='submit'>
    </form>
  EOF
end

post_get '/' do
  "Hi #{params[:name]}<br>\n#{settings.menu_get}<br>\n#{settings.menu_post}"
end
