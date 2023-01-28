require 'sinatra'
require './sinatra/post_get'

configure do
  set :menu_get, <<~EOF
    <p>
    <a href='/'>no name</a>,
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
  name = params[:name]
  greet = "<p>Hi, #{name}!</p>" unless name.to_s.empty?
  <<~EOF
    #{greet}
    #{settings.menu_get}
    #{settings.menu_post}
  EOF
end
