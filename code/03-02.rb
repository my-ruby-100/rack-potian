require_relative './bootstrap'
require_relative './builder'
require_relative './decorator'

app = Builder.new {
  use Rack::ContentLength
  use Decorator
  run lambda {|env| [200, {"Content-Type"=>"text/html"}, ["hello world"]]}
}.to_app

Rack::Handler::WEBrick.run app ,:Port=>3000