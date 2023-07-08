require_relative './bootstrap.rb'
require_relative './decorator'

app = Rack::Builder.new {
  map '/hello' do
    run lambda {|env| [200, {"Content-Type" => "text/html"}, ["hello"]] }
  end

  map '/world' do
    run lambda {|env| [200, {"Content-Type" => "text/html"}, ["world"]] }
  end

  map '/' do
    run lambda {|env| [200, {"Content-Type" => "text/html"}, ["all"]] }
  end
}.to_app

Rack::Handler::WEBrick.run app ,:Port=>3000