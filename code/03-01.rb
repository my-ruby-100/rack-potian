require_relative './bootstrap'
require_relative './decorator'

rack_app = lambda{|env|
  request = Rack::Request.new(env)
  response = Rack::Response.new

  if request.path_info == '/hello'
    response.write('you say hello')
    client = request['client']
    response.write("from #{client}") if client
  else
    response.write('you need provide some client information')
  end
  response.finish
}

Rack::Handler::WEBrick.run Decorator.new(rack_app) ,:Port=>3000