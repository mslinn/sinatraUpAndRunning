# Simple Sinatra Examples
These examples span from the beginning of the book, up to but not including the *Architecture* section of Chapter 4.

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
