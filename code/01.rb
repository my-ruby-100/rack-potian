require_relative 'bootstrap.rb'

rack_app = lambda{|env| [200,{},["hello from lambda"]]}
Rack::Handler::WEBrick.run rack_app ,:Port=>3000