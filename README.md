# Sinatra Up And Running Code
Selected code examples from
[Sinatra Up And Running Code](https://www.oreilly.com/library/view/sinatra-up-and/9781449306847/).
The book's code examples are dated, as is the book itself,
and some objectionable code is presented,
so I updated and improved the code.


## Getting started
Use [`rerun`](https://github.com/alexch/rerun) instead of
[`shotgun`](https://github.com/rtomayko/shotgun).


### Native Ubuntu
```shell
$ sudo apt install rerun

$ bundle install
```


### WSL / WSL2
Rerun does not work without the full Linux machinery, so
[enable `systemd`](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/).

Now follow the native Ubuntu instructions above.


## VS Code Debug
A `.vscode/launch.json` file is provided.


## Rerun From Command Line
```shell
$ rerun 1-5.rb
```
Point your web browser to http://localhost:4567

Other webapps:
```shell
$ rerun 3-7.rb

$ rerun 3-9.rb

$ rerun 4-1.rb
```


## Run As Rack App
From the [`rackup` code](https://github.com/macournoyer/thin/blob/master/lib/thin/server.rb#L27-L28):
> A valid Rack adapter (application) must respond to <tt>call(env#Hash)</tt> and return an array of <tt>[status, headers, body]</tt>.

If `4-1.rb` was made into a Rack app, then the following would work.

### Development
```shell
$ rackup
```
Point your web browser to http://localhost:9292


### Production
```shell
$ rackup --env production config.ru
```
Point your web browser to http://localhost:9292


## For More Information
 - [Setting Up a Ruby Development Environment](https://www.mslinn.com/jekyll/500-ruby-setup.html)
 - [Sinatra Request Explorer](https://www.mslinn.com/blog/2022/12/02/sinatraRequestExplorer.html)
 - [Authentication & Authorization With Sinatra / Warden](https://www.mslinn.com/blog/2022/12/05/sinatra-warden.html).
